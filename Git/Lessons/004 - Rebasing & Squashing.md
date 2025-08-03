#### Interactive Rebase
- Lets you rewrite commit history.
- Common uses:
    - Squash multiple commits into one.
    - Reorder commits.
    - Edit commit messages.
#### Why Squash?
- Keeps history **clean & meaningful**.
- Avoids clutter from “WIP” (Work In Progress) commits.
#### After Rewriting History
- You must **force push** (`git push --force`) because commit IDs have changed.
#### Commands
1.1. Interactive Rebase
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