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

## Directory Layout (minimal baseline)

- `src/` - application/source code
- `tests/` - automated tests
- `.github/workflows/` - CI workflows
- `.github/ISSUE_TEMPLATE/` - issue templates

If these directories do not exist yet, create only what is needed for the current task.
