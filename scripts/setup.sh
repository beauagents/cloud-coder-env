#!/usr/bin/env sh
# setup.sh - Environment setup for cloud coding agents (Jules, Codex, etc.)
# Idempotent, lightweight, POSIX-sh. Detects Node.js and Python projects,
# installs dependencies, and runs lint/tests as validation when available.
set -eu

echo "== cloud-coder-env setup ="
echo "node: $(command -v node >/dev/null 2>&1 && node -v || echo 'not found')"
echo "python: $(command -v python3 >/dev/null 2>&1 && python3 --version || echo 'not found')"

# --- Node.js ---
if [ -f package.json ]; then
echo "[node] package.json detected"
if command -v bun >/dev/null 2>&1 && [ -f bun.lockb ]; then
bun install
elif command -v npm >/dev/null 2>&1; then
if [ -f package-lock.json ]; then npm ci || npm install; else npm install; fi
fi
fi

# --- Python ---
if [ -f requirements.txt ]; then
echo "[python] requirements.txt detected"
python3 -m pip install --upgrade pip
python3 -m pip install -r requirements.txt
elif [ -f pyproject.toml ]; then
echo "[python] pyproject.toml detected"
python3 -m pip install --upgrade pip
python3 -m pip install -e . || python3 -m pip install .
fi

# --- Validation (best-effort) ---
if [ -f package.json ] && command -v npm >/dev/null 2>&1; then
npm run lint --if-present
npm test --if-present
fi

echo "== setup complete ="
