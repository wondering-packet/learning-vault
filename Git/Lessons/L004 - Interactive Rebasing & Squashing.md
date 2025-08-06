#### **Interactive Rebase**

- Lets you rewrite commit history.
- Common uses:
    - Squash multiple commits into one.
    - Reorder commits.
    - Edit commit messages.

#### **Why Squash?**

- Keeps history **clean & meaningful**.
- Avoids clutter from “WIP” (Work In Progress) commits.
- KB: [KB010 - Squashing](../KBs/KB010%20-%20Squashing.md).
- Exercise: [E004 - Squashing with Interactive Rebase](../Exercises/E004%20-%20Squashing%20with%20Interactive%20Rebase.md).
#### **Rewriting History**

- DO NOT rebase if other have already pulled in your commits. If you do, then that will rewrite history and:

	- **You'll Overwrite Other People's Work:** If another developer has based their work on the old history, your force push will overwrite their commits, leading to a lot of headaches and lost work.
	- **It's a "Cardinal Sin" in Git:** Rewriting shared history is considered a bad practice in most team environments. It should only be done on a branch that you are the sole contributor to and that no one else has pulled from.

#### **Commands**

1. Interactive Rebase

    ```bash
    git rebase -i HEAD~<n>      # Edit last n commits
    ```

    Inside the rebase editor:
	- `pick` → keep commit
	- `squash` (or `s`) → merge into previous commit
	- `reword` → change commit message

2. Continue / Abort
	```bash
	git rebase --continue              # Continue after fixing conflicts
	git rebase --abort                 # Abort rebase
	```
3. Force Push After Rebase
	```bash
	git push origin <branch> --force   # Required if branch history changed
	```
