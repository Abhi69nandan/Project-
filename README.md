# 🤖 CompanionAI — Elderly-Friendly AI Desktop Assistant

A warm, patient, JARVIS-like AI desktop companion built specifically for elderly users.
Powered by **Groq LLaMA3**, **Python FastAPI**, and **Electron.js**.

---

## ✨ Features

| Feature | Description |
|---|---|
| 💬 **AI Chat** | Natural conversation powered by Groq LLaMA3-70B |
| 🎙️ **Voice Input** | Speak instead of typing (Google Speech Recognition) |
| 🔊 **Voice Output** | Responses read aloud via text-to-speech |
| 🔔 **Reminders** | One-time, daily, or weekly reminders with alerts |
| ✅ **Task Manager** | Simple to-do list with priorities |
| 🖥️ **Jarvis UI** | Dark, futuristic interface with large readable text |

---

## 🗂️ Project Structure

```
companion-ai/
├── backend/
│   ├── server.py          # FastAPI server (LLM, STT, TTS, DB)
│   ├── requirements.txt   # Python dependencies
│   └── companion.db       # SQLite (auto-created)
├── frontend/
│   ├── main.js            # Electron main process
│   ├── preload.js         # Secure IPC bridge
│   └── src/
│       ├── index.html     # App UI
│       ├── styles.css     # Dark Jarvis theme
│       └── app.js         # Frontend logic
├── scripts/
│   └── setup.sh           # One-command setup
└── package.json
```

---

## 🚀 Quick Start

### 1. Prerequisites
- **Python 3.10+**
- **Node.js 18+**
- **npm**
- A **Groq API Key** (free at https://console.groq.com)

### 2. System Dependencies

**Linux (Ubuntu/Debian):**
```bash
sudo apt install portaudio19-dev python3-pyaudio
```

**macOS:**
```bash
brew install portaudio
```

**Windows:**
- Install PyAudio via: `pip install pipwin && pipwin install pyaudio`

### 3. Setup

```bash
# Clone or extract the project
cd companion-ai

# Run setup (installs Python venv + Node modules)
chmod +x scripts/setup.sh
./scripts/setup.sh

# Set your Groq API key
export GROQ_API_KEY=gsk_your_key_here
```

### 4. Launch

```bash
npm start
```

---

## 🧠 Tech Stack

| Layer | Technology |
|---|---|
| Desktop App | Electron.js |
| AI Backend | Python FastAPI + Uvicorn |
| LLM | Groq API (LLaMA3-70B-8192) |
| Database | SQLite (via Python sqlite3) |
| Voice Input | SpeechRecognition + PyAudio |
| Voice Output | pyttsx3 (offline TTS) |
| UI Fonts | Orbitron + Nunito |

---

## 🔧 Configuration

### GROQ API Key
Set as environment variable before launching:
```bash
export GROQ_API_KEY=gsk_...
```
Or enter it in the app's **Settings** tab (requires restart).

### Voice Settings
Toggle voice responses on/off in the **Settings** tab.

---

## 🎨 UI Design Philosophy

- **Large, readable text** — minimum 14px, most text 16–22px
- **High contrast** dark theme — easy on the eyes
- **Simple navigation** — 4 big buttons in sidebar
- **Voice-first** — prominent microphone button
- **Clear feedback** — orb changes color for listening/thinking states

---

## 🔔 Reminder System

Reminders are stored in SQLite and checked every 30 seconds.
When due:
1. A popup appears on screen
2. The reminder is read aloud via TTS
3. An OS notification is sent

Repeat options: **once**, **daily**, **weekly**

---

## 📝 Task Priorities

- 🔴 **High** — urgent tasks
- 🔵 **Normal** — regular tasks  
- ⚫ **Low** — someday/maybe

---

## 🔒 Privacy

- All data stored **locally** in `backend/companion.db`
- Voice processing uses Google Speech API (internet required)
- TTS is **fully offline** via pyttsx3
- Chat history sent to Groq API (see their privacy policy)

---

## 🛠️ Troubleshooting

**Backend won't start:**
```bash
cd backend && source venv/bin/activate && python server.py
```

**No voice input:**
- Check microphone permissions
- Install portaudio: `sudo apt install portaudio19-dev`

**TTS not working on Linux:**
```bash
sudo apt install espeak
```

**App shows "Offline":**
- Wait a few seconds for backend to start
- Check if port 8765 is free: `lsof -i :8765`
