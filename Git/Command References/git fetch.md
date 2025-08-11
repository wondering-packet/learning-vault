### **Command**

`git fetch`

### **Purpose**

Downloads commits, files, and references (like branches and tags) from a remote repository into your local repository without automatically merging them. It updates your local copy of the remote's state, giving you a preview of the changes.

### **Syntax**

git fetch <remote>

git fetch --all

### **Key Flags**

- `--all`: Fetches from all configured remote repositories. This is useful for getting the latest from all your connected sources at once.
    
- `--prune`: Removes any remote-tracking branches that no longer exist on the remote. This helps keep your local repository clean.
    

### **Example**

```bash
# Fetches all branches and tags from the remote named 'origin'
git fetch origin

# Fetches from all remotes and prunes branches that no longer exist
git fetch --all --prune

# After fetching, you can see what has changed by comparing your local branch to the remote one
git log HEAD..origin/main
```

### **Related Commands**

- **`git pull`**: Downloads remote changes and **merges** them into your current local branch. `git fetch` is the safer, non-destructive part of this command.
    
- **`git remote`**: Manages the remote repositories you are connected to. `git remote -v` shows a list of your remotes.
    
- **`git merge`**: The command you would use to manually apply the changes you downloaded with `git fetch` to your local branch.