
import os
import subprocess
import threading
import asyncio
from queue import Queue
from pyrogram import Client

# === CONFIG ===
api_id = 20157033
api_hash = "ad758d3d3ec52c0b0789f0c2b44eb92a"
bot_token = "8044120271:AAEjhcnP-pgVwukeS31cPWTuRT6i_NEg4VA"
channel = "@fuckyoujee"
sh_file = "Lakshya_JEE_Hindi_2025.sh"
max_threads = 3

# === Install Required Tools ===
print("🔧 Installing packages...")
os.system("apt update -y && apt install ffmpeg -y")
os.system("pip install -q yt-dlp pyrogram tgcrypto")

# === Resume logic via bot messages ===
print("🤖 Starting bot session...")
bot = Client("bot", api_id=api_id, api_hash=api_hash, bot_token=bot_token)

last_uploaded = None
with bot:
    print("🔍 Checking last uploaded file from channel...")
    for msg in bot.get_chat_history(channel, limit=50):
        if msg.caption and msg.caption.startswith("✅ Uploaded: "):
            last_uploaded = msg.caption.replace("✅ Uploaded: ", "").strip()
            print(f"📌 Resuming after: {last_uploaded}")
            break

# === Parse the .sh File ===
with open(sh_file, "r") as f:
    lines = f.readlines()

jobs = []
resume = False if last_uploaded else True
for line in lines:
    if not line.strip().startswith("yt-dlp"):
        continue
    filename = None
    if "-o" in line:
        try:
            filename = line.split("-o")[1].split('"')[1]
        except:
            continue
    if not resume:
        if filename and last_uploaded and filename == last_uploaded:
            resume = True
        continue
    jobs.append((line.strip(), filename))

# === Worker Thread with Asyncio for Bot ===
def worker():
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    bot_client = Client("bot", api_id=api_id, api_hash=api_hash, bot_token=bot_token)
    bot_client.start()

    while True:
        try:
            cmd, fname = q.get(timeout=3)
        except:
            break

        print(f"▶️ Downloading: {fname}")
        try:
            subprocess.run(cmd, shell=True, check=True)
        except:
            print(f"❌ Download failed: {fname}")
            q.task_done()
            continue

        if not os.path.exists(fname):
            print(f"❌ File not found: {fname}")
            q.task_done()
            continue

        print(f"⏫ Uploading: {fname}")
        try:
            if fname.endswith((".mp4", ".mkv", ".webm")):
                fixed = "fixed_" + fname
                os.system(f'ffmpeg -i "{fname}" -c copy -movflags +faststart "{fixed}" -y')
                bot_client.send_video(channel, fixed, caption=f"✅ Uploaded: {fname}", supports_streaming=True)
                os.remove(fixed)
            else:
                bot_client.send_document(channel, fname, caption=f"✅ Uploaded: {fname}")
            print(f"✅ Uploaded: {fname}")
            os.remove(fname)
        except Exception as e:
            print(f"❌ Upload failed for {fname}: {e}")
        q.task_done()

    bot_client.stop()

# === Start Threads ===
print(f"🚀 Starting uploads with {max_threads} threads...")
q = Queue()
for job in jobs:
    q.put(job)

threads = []
for _ in range(max_threads):
    t = threading.Thread(target=worker)
    t.start()
    threads.append(t)

q.join()
print("🎉 All uploads complete.")
