# Branching, Merging, Rebasing & Conflict Resolution in Git

These are core Git concepts used to manage parallel development, maintain clean commit histories, and collaborate with others.

---

## 🌿 Branches

- A branch is just a **pointer** to a commit.
- `main` (or `master`) is the default branch.
- Feature branches allow isolated development.

📚 KB: [KB001 - Main or Master Branch](../KBs/KB001%20-%20Main%20or%20Master%20Branch.md)

---

## 🔀 Merging

- Combines histories of two branches.

### Types:
- **Fast-forward merge** → when `main` hasn’t changed since branch was created.
  - 📚 KB: [KB003 - Merge fast-forward](../KBs/KB003%20-%20Merge%20fast-forward.md)  
  - 🧪 Exercise: [E002b - Merging branch](../Exercises/E002b%20-%20Merging%20branch.md) (Section 1)

- **Merge commit** → when branches have diverged.
  - 🧪 Exercise: [E002b - Merging branch](../Exercises/E002b%20-%20Merging%20branch.md) (Section 2)

---

## 📚 Rebasing

- Moves your branch commits **on top of** another branch.
- Keeps history linear → no merge commits.
- Use with caution in shared branches.

📚 KB: [KB004 - Rebase](../KBs/KB004%20-%20Rebase.md)  
🧪 Exercise: [E002c - Rebase](../Exercises/E002c%20-%20Rebase.md)

---

## ⚔️ Conflicts

- Occur when Git can’t auto-resolve changes between branches.
- Files will contain conflict markers:
```plaintext
<<<<<<< HEAD                         # your current branch’s code
=======                              # separator
>>>>>>> branch_name_or_commit_id     # the other branch’s code
```

### Steps to resolve:
```bash
# 1. Edit file to resolve the conflict
nano <file>

# 2. Stage the resolved file
git add <file>

# 3. Continue the merge or rebase
git merge --continue   # for merges
git rebase --continue  # for rebases
```

📚 KB: [KB006 - Conflict](../KBs/KB006%20-%20Conflict.md)  
🧪 Exercise: [E002d - Conflict](../Exercises/E002d%20-%20Conflict.md)

---

## 🛠️ Commands Summary

### 1. Create & Switch Branch
```bash
git branch <branch_name>           # Create branch
git switch <branch_name>           # Switch to branch
git switch -c <branch_name>        # Create + switch
git branch                         # List all branches (* marks current)
```

### 2. Merge
```bash
git switch main
git merge <branch_name>            # Merge into current branch
```

### 3. Rebase
```bash
git switch <feature_branch>
git rebase main                    # Replay commits onto main
```

### 4. Resolve Merge Conflicts
```plaintext
<<<<<<< HEAD
changes from current branch
=======
changes from merging branch
>>>>>>> branch_name_or_commit_id
```

```bash
# Step1: Edit file to fix conflict
nano <file>

# Step2: Stage the file
git add <file>

# Step3: Continue
git rebase --continue
# or
git merge --continue
```

### 5. Push New Branch
```bash
git push origin -u <branch_name>   # Push and set upstream
```

> `-u` sets the upstream so future pushes don’t need the branch name.

### 6. Delete Branch
```bash
git branch -d <branch_name>        # Delete local branch (safe)
git branch -D <branch_name>        # Force delete local branch
git push origin --delete <branch>  # Delete remote branch
```

---

Git branches, merging, and rebasing are how you build collaboration and maintain clarity. Mastering conflict resolution is key to working smoothly in teams.