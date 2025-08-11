### **Command**

`git pull`

### **Purpose**

Fetches and downloads content from a remote repository and immediately updates your local repository to match that content. It's a combination of `git fetch` and `git merge` by default.

### **Syntax**

git pull <remote> <branch>

git pull --rebase

### **Key Flags**

- `--rebase`: This flag is used to apply your local commits on top of the fetched remote commits, creating a clean, linear history. This is often preferred over the default merge.
    
- `--no-commit`: This downloads the remote changes but doesn't automatically create a merge commit. This allows you to review the changes before committing them yourself.
    

### **Example**

Bash

```
# Pulls changes from the 'main' branch of the 'origin' remote,
# and merges them into your current local branch.
git pull origin main

# Fetches the latest changes and then rebases your local branch
# on top of them, creating a linear history.
git pull --rebase

# Sets your local branch to track a remote branch, so you can
# simply use 'git pull' without specifying the remote and branch.
git branch --set-upstream-to=origin/main
```

### **Related Commands**

- **`git fetch`**: The "download" part of `git pull`. It gets the latest remote commits but doesn't merge them. This lets you inspect changes before applying them.
    
- **`git merge`**: The "apply" part of `git pull`'s default behavior. It takes the fetched commits and merges them into your current branch, creating a merge commit.
    
- **`git rebase`**: The "apply" part of `git pull --rebase`. It moves your local commits to the top of the fetched commits, rewriting history for a cleaner look.