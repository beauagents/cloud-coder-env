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
