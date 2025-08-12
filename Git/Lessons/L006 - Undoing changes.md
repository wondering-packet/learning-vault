# Undoing Changes in Git

Git operates across three layers:
1. **Working Directory** – your actual files
2. **Staging Area (Index)** – what’s ready to commit
3. **Commit History** – saved snapshots

> [!NOTE]
> Find the exercise for this lesson here: [E006a - Undoing changes](E006a%20-%20Undoing%20changes.md). 

---

## 🔧 1. Discarding Changes in the Working Directory

### Discard changes to a tracked file:
```bash
git restore <file>
# or legacy:
git checkout -- <file>
```

### Discard ALL uncommitted changes:
```bash
git restore .          # this is for the changes that have not been staged.
git restore --staged . # this for the changes that have been staged.
```

> "." means all.

---

## 🧼 2. Unstaging Files

### Unstage a file (remove from staging area):
```bash
git restore --staged <file>
# or legacy:
git reset <file>
```

---

## 🗑️ 3. Removing Untracked Files

### Clean untracked files and directories:
```bash
git clean -fd
```

### Preview before cleaning (safe mode):
```bash
git clean -fdn
```

---

## ⏪ 4. Undoing Commits

### a) Fix last commit (message or files):
```bash
git commit --amend
```

### b) Undo last commit, keep changes staged:
```bash
git reset --soft HEAD~1
```

### c) Undo last commit, keep changes in working directory:
```bash
git reset --mixed HEAD~1
```

### d) Undo last commit, discard everything:
```bash
git reset --hard HEAD~1
```

---

## 🧨 5. Reverting Commits Safely

### Reverse a commit with a new one:
```bash
git revert <commit-hash>
```

---

## 🧙‍♂️ 6. Recovering Lost Commits

### View commit history including lost ones:
```bash
git reflog
# here you will have to find the hash for the lost commit.
```

### Restore from reflog:

1. Checking out & then branching off the detached commit:

```bash
git checkout <commit-hash>
# from here you can now create a new branch off this detached commit & then
# work on the new branch like you would normally on a normal branch
# (merge, stash, rebase etc.)
```

2. Cherry picking:

```bash
git cherry-pick <commit-has>
# this will replay the commit into a new commit.
```

## 🦺 7. Safety Net for Advanced Ops

- Before **hard reset**, always:

```bash
git branch backup-before-reset
```

- Before **rebase**, always:

```bash
git branch backup-before-rebase
```

---

## 🧠 TL;DR – Undo Cheat Sheet

| **Action**                    | **Command**                     |
| ----------------------------- | ------------------------------- |
| Discard file change           | `git restore <file>`            |
| Unstage file                  | `git restore --staged <file>`   |
| Undo last commit, keep all    | `git reset --soft HEAD~1`       |
| Undo last commit, keep files  | `git reset --mixed HEAD~1`      |
| Undo & wipe all               | `git reset --hard HEAD~1`       |
| Revert safely with new commit | `git revert <commit>`           |
| Clean untracked junk          | `git clean -fd`                 |
| Find lost commits             | `git reflog`                    |
| Backup before reset           | git branch backup-before-reset  |
| Backup before rebase          | git branch backup-before-rebase |
