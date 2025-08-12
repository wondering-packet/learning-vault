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
# This is a logbook of every place HEAD has been.
# Find the hash for the lost commit you want to restore.
```

### Recovery:

There are a few ways to recover commits depending on your goal.

#### **1. Restoring a Branch to a Previous State**

This method is best when you want to fully undo a mistake and return your entire branch to how it was before. It's especially useful for reversing a `git reset --hard`.

Bash

```
# First, find the commit you want to restore from the reflog.
# Then, use `git reset --hard` to forcefully move your branch back to that commit.
git reset --hard <commit-hash-from-reflog>
```

#### **2. Restoring a Specific Commit to Your Current Branch**

This is the method you found with `git cherry-pick`. It's perfect for when you want to apply the changes from a lost commit, but you don't want to revert your entire branch's history.

Bash

```
git cherry-pick <commit-hash-from-reflog>
# This will replay the commit's changes and create a new commit on your current branch.
# It's great for bringing a specific fix or feature back.
```

#### **3. Inspecting a Commit & Branching Off**

This method is for when you want to explore the history from a lost commit without affecting your current branch at all. You can look at the code, and if you like it, you can create a new branch from there.

Bash

```
# This will put you into a "detached HEAD" state at the chosen commit.
git checkout <commit-hash>

# If you decide you want to keep the work, create a new branch from this point.
git switch -c new-lost-feature
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
