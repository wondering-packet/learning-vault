

### Commands
1. Interactive Rebase
```bash
git rebase -i HEAD~<n>             # Edit last n commits
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

```