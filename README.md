# Cloud Coder Environment Sandbox

This repository is a minimal, standards-based sandbox for cloud AI coding agents (for example: GitHub Copilot, OpenAI Codex, Claude, Gemini, Jules, and CI bots) to safely connect, read conventions, and make small validated changes.

## Purpose

- Provide a clean workspace for automated and human contributors.
- Keep conventions explicit and machine-readable.
- Support basic CI for lint/test execution when project code is present.

## Repository Structure

- `README.md` - project overview and setup/usage.
- `CONTRIBUTING.md` - contribution workflow for humans and agents.
- `AGENTS.md` - concise operational guidance for coding agents.
- `.editorconfig` - cross-editor formatting defaults.
- `.gitignore` - Node.js + Python ignores.
- `.github/workflows/ci.yml` - baseline CI checks (GitHub Actions).
- `.github/ISSUE_TEMPLATE/` - issue templates.
- `.github/pull_request_template.md` - PR template.
- `scripts/setup.sh` - portable environment setup script for supported cloud agents, including Jules.
- `docs/jules.md` - connecting the repo to Google Jules.
- `LICENSE` - MIT license.

## Getting Started

1. Clone the repository.
2. Read `AGENTS.md` and `CONTRIBUTING.md` before making changes.
3. Add your project code in dedicated directories (for example `src/`, `tests/`).
4. Ensure lint and test commands exist in your language ecosystem.
5. For hosted agents that support an initial setup command, prefer `bash scripts/setup.sh`.

## How Cloud Agents Should Use This Repo

1. Read `AGENTS.md` first for required conventions and command order.
2. Make minimal, scoped changes.
3. Run relevant lint/test commands for changed areas.
4. Update docs/templates if behavior or workflows change.
5. Open a PR using `.github/pull_request_template.md`.

Supported cloud agents currently include GitHub Copilot, OpenAI Codex, Claude, Gemini, and Jules. Jules users should point their Initial Setup command at `bash scripts/setup.sh`; see `docs/jules.md`.

## Environment Setup

A portable setup script at `scripts/setup.sh` detects Node.js and Python projects, installs dependencies, and runs available lint/tests as validation:

```sh
bash scripts/setup.sh
```

For Jules specifically, use `bash scripts/setup.sh` as the Initial Setup command in the Jules Configuration window. See `docs/jules.md` for full connection steps.

## Local Validation

This sandbox intentionally does not force one language stack. CI auto-detects available Node/Python tooling and runs matching lint/test commands when present.

## License

MIT - see `LICENSE`.
