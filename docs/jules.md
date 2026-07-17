# Using this repository with Jules

[Jules](https://jules.google) is Google's asynchronous coding agent. Each task runs in a short-lived Ubuntu VM that clones the repo, prepares the environment, and runs your tasks.

## How Jules sets up the environment

For simple cases, Jules studies the repo and reads `AGENTS.md` and `README.md` for hints to set up on the fly. For anything more involved, provide an explicit setup script.

This repo ships one at [`scripts/setup.sh`](../scripts/setup.sh). It detects Node.js and Python projects, installs dependencies, and runs available lint/tests as validation.

## Preinstalled tools on the Jules VM

Jules VMs run Ubuntu and come with Node.js, Bun, Python, Go, Java, and Rust preinstalled, so tasks generally do not need to reinstall these runtimes.

## Connecting the repo

1. Open https://jules.google and sign in with the Google account linked to this GitHub org.
2. Under **Codebases**, select this repository (`beauagents/cloud-coder-env`).
3. Open **Configuration**.
4. In the **Initial Setup** window, paste:

   ```sh
   bash scripts/setup.sh
   ```

5. Click **Run and Snapshot** to validate the setup and capture an environment snapshot for future tasks.

## Validation tips

- Use the validation button to catch errors early.
- Keep setup lightweight and fast.
- Add version checks (e.g., `node -v`, `python3 --version`) to confirm the toolchain.
- To list all preinstalled tools inside a Jules VM: `set +x; . /opt/environment_summary.sh`
