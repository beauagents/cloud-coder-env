#!/bin/sh

set -eu

echo "Node version:"
if command -v node >/dev/null 2>&1; then
  node -v
else
  echo "node not found"
fi

echo "Python version:"
if command -v python >/dev/null 2>&1; then
  PYTHON_BIN=python
elif command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN=python3
else
  PYTHON_BIN=
fi

if [ -n "${PYTHON_BIN}" ]; then
  "${PYTHON_BIN}" --version
else
  echo "python not found"
fi

if [ -f package.json ]; then
  echo "Installing Node dependencies..."
  if [ -f bun.lockb ] || [ -f bun.lock ]; then
    if ! command -v bun >/dev/null 2>&1; then
      echo "bun lockfile detected but bun is not installed" >&2
      exit 1
    fi
    bun install --frozen-lockfile
  elif [ -f package-lock.json ]; then
    npm ci
  else
    npm install
  fi

  echo "Running Node lint..."
  npm run lint --if-present
  echo "Running Node tests..."
  npm test --if-present
else
  echo "No package.json found; skipping Node setup."
fi

if [ -f requirements.txt ] || [ -f requirements-dev.txt ] || [ -f pyproject.toml ]; then
  if [ -z "${PYTHON_BIN}" ]; then
    echo "Python project detected but no Python interpreter is installed" >&2
    exit 1
  fi

  echo "Installing Python dependencies..."
  "${PYTHON_BIN}" -m pip install --upgrade pip
  if [ -f requirements.txt ]; then
    "${PYTHON_BIN}" -m pip install -r requirements.txt
  fi
  if [ -f requirements-dev.txt ]; then
    "${PYTHON_BIN}" -m pip install -r requirements-dev.txt
  fi
  if [ -f pyproject.toml ] && [ ! -f requirements.txt ] && [ ! -f requirements-dev.txt ]; then
    "${PYTHON_BIN}" -m pip install .
  fi

  echo "Running Python lint..."
  if "${PYTHON_BIN}" -m pip show ruff >/dev/null 2>&1; then
    "${PYTHON_BIN}" -m ruff check .
  else
    echo "ruff not installed; skipping Python lint."
  fi

  echo "Running Python tests..."
  if "${PYTHON_BIN}" -m pip show pytest >/dev/null 2>&1; then
    "${PYTHON_BIN}" -m pytest
  else
    echo "pytest not installed; skipping Python tests."
  fi
else
  echo "No Python project files found; skipping Python setup."
fi
