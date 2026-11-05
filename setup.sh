#!/bin/bash
# CompanionAI Setup Script
set -e

echo "╔══════════════════════════════════════╗"
echo "║        CompanionAI Setup             ║"
echo "╚══════════════════════════════════════╝"

# ── Python Backend Setup ──────────────────────────────────────────────────────
echo ""
echo "▶ Setting up Python backend..."
cd backend

if [ ! -d "venv" ]; then
  python3 -m venv venv
  echo "  ✓ Virtual environment created"
fi

source venv/bin/activate
pip install -r requirements.txt --quiet
echo "  ✓ Python dependencies installed"

# Check PyAudio (may need system libs)
python3 -c "import pyaudio" 2>/dev/null || {
  echo ""
  echo "  ⚠ PyAudio not found. On Linux, run:"
  echo "    sudo apt install portaudio19-dev python3-pyaudio"
  echo "  On Mac:"
  echo "    brew install portaudio"
}

deactivate
cd ..

# ── Node.js Setup ─────────────────────────────────────────────────────────────
echo ""
echo "▶ Setting up Node.js / Electron..."
npm install --quiet
echo "  ✓ Node dependencies installed"

# ── API Key ───────────────────────────────────────────────────────────────────
echo ""
if [ -z "$GROQ_API_KEY" ]; then
  echo "  ⚠ GROQ_API_KEY not set."
  echo "  Get a free key at: https://console.groq.com"
  echo "  Then run: export GROQ_API_KEY=your_key_here"
else
  echo "  ✓ GROQ_API_KEY is set"
fi

echo ""
echo "╔══════════════════════════════════════╗"
echo "║  Setup complete!                     ║"
echo "║  Run: export GROQ_API_KEY=your_key   ║"
echo "║       npm start                      ║"
echo "╚══════════════════════════════════════╝"
