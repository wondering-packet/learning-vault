### **Command**

`git revert <commit>`

### **Purpose**

`git revert` is used to undo existing commits. It does this by creating a **new commit** that "reverts" or undoes the changes introduced by the specified commit. Unlike `git reset`, it does not delete or alter the project history.

### **Syntax**

git revert <commit_hash>

git revert <commit_hash>..<another_commit_hash>

### **Key Flags**

- `--no-edit`: Reverts the commit without launching the text editor to prompt for a commit message.
    
- `--no-commit`: This flag stops `git revert` from creating a new commit. It simply applies the reverted changes to your working directory and staging area, allowing you to make more changes or combine the revert with another commit.
    
- `-n` or `--no-commit`: Same as `--no-commit`.
    

### **Example**

```bash
# Reverts the last commit on the current branch
git revert HEAD

# Creates a new commit that undoes the changes from a specific commit
git revert 287b4f5

# Reverts the last two commits, creating two new revert commits.
# Note: The order is reversed, so HEAD~2 is reverted first, then HEAD~1.
git revert HEAD~2..HEAD
```

### **Related Commands**

- **`git reset`**: `git reset` also undoes changes, but it does so by moving your branch pointer, effectively erasing commits from history. This is dangerous on shared branches.
    
- **`git cherry-pick`**: `git cherry-pick` copies changes from a specific commit to a new commit. It's similar to `git revert` in that it creates a new commit, but its purpose is to apply a change, not to undo one.