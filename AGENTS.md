# AGENTS Guide

This file gives cloud coding agents a stable operating contract for this repository.

## Conventions

- Make the smallest change that fully solves the task.
- Do not modify unrelated files.
- Update documentation when workflows or behavior change.
- Never commit secrets or credentials.

## Recommended Change Flow

1. Read `README.md` and `CONTRIBUTING.md`.
2. Inspect current files and tooling.
3. Implement focused changes.
4. Run lint then test for affected stack.
5. Summarize changes and validation in PR.

## Build/Test Commands

Use only commands relevant to files present in the repo:

### Node.js (if `package.json` exists)
- Lint: `npm run lint --if-present`
- Test: `npm test --if-present`

### Python (if Python project files exist)
- Lint: run configured linter (for example `ruff check .` if configured)
- Test: run configured test command (for example `pytest` if configured)

## Jules

- Jules is a supported cloud coding agent for this repository.
- Jules reads `AGENTS.md` and `README.md` for setup hints during task startup, or it can run an explicit setup command.
- Recommended Jules Initial Setup command: `bash scripts/setup.sh`
- `scripts/setup.sh` installs detected Node.js and Python dependencies, prints runtime versions, and runs any available lint/test validation.
- Jules Ubuntu VMs already include Node.js, Bun, Python, Go, Java, and Rust, so tasks should reuse those preinstalled tools instead of reinstalling runtimes.
- After a successful Jules setup run, take a snapshot so later tasks can start from the prepared environment.

## Directory Layout (minimal baseline)

- `src/` - application/source code
- `tests/` - automated tests
- `.github/workflows/` - CI workflows
- `.github/ISSUE_TEMPLATE/` - issue templates

If these directories do not exist yet, create only what is needed for the current task.


## Supported Agents

This repo is designed to work with cloud coding agents including GitHub Copilot, OpenAI Codex, Claude, Gemini, Travis CI, and Google Jules.

## Jules

[Jules](https://jules.google) is Google's asynchronous coding agent. It runs each task in a short-lived Ubuntu VM and reads this `AGENTS.md` and `README.md` for hints to set up the environment on the fly. For explicit setup, Jules runs a setup script.

- Recommended Initial Setup command (Jules Configuration window): `bash scripts/setup.sh`
- After a successful setup run, Jules takes an environment snapshot reused by future tasks.
- Jules VMs preinstall Node.js, Bun, Python, Go, Java, and Rust, so avoid reinstalling these runtimes.
- Full connection steps: see [`docs/jules.md`](docs/jules.md).
