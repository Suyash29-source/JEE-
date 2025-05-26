
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
uploaded_file = "uploaded.txt"
max_threads = 3

# === Setup uploaded.txt ===
if not os.path.exists(uploaded_file):
    open(uploaded_file, "w").close()

with open(uploaded_file, "r") as f:
    uploaded = set(line.strip() for line in f.readlines())

# === Parse .sh file ===
with open(sh_file, "r") as f:
    lines = f.readlines()

jobs = []
for line in lines:
    if not line.strip().startswith("yt-dlp"):
        continue
    filename = None
    if "-o" in line:
        try:
            filename = line.split("-o")[1].split('"')[1]
        except:
            continue
    if filename in uploaded:
        continue
    jobs.append((line.strip(), filename))

# === Worker function ===
def worker():
    loop = asyncio.new_event_loop()
    asyncio.set_event_loop(loop)
    bot = Client("bot", api_id=api_id, api_hash=api_hash, bot_token=bot_token)
    bot.start()

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
                bot.send_video(channel, fixed, caption=f"✅ Uploaded: {fname}", supports_streaming=True)
                os.remove(fixed)
            else:
                bot.send_document(channel, fname, caption=f"✅ Uploaded: {fname}")
            print(f"✅ Uploaded: {fname}")
            os.remove(fname)

            # Write to uploaded.txt
            with open(uploaded_file, "a") as log:
                log.write(fname + "\n")

        except Exception as e:
            print(f"❌ Upload failed for {fname}: {e}")
        q.task_done()

    bot.stop()

# === Run Threads ===
from queue import Queue
print(f"🚀 Starting {max_threads} threads...")
q = Queue()
for job in jobs:
    q.put(job)

threads = []
for _ in range(max_threads):
    t = threading.Thread(target=worker)
    t.start()
    threads.append(t)

q.join()
print("🎉 All uploads completed.")
