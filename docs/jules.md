# Jules Setup

1. Open `https://jules.google/` and connect this repository.
2. In Jules, open the repository configuration for the task.
3. In **Configuration** > **Initial Setup**, paste `bash scripts/setup.sh`.
4. Run the setup command.
5. After setup succeeds, create a snapshot so later tasks can reuse the prepared environment.

Jules also reads `AGENTS.md` and `README.md` for setup hints, so keep those files aligned with `scripts/setup.sh`.
