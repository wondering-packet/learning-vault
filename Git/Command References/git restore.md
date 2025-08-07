#### **Command**

`git restore`

#### **Purpose**

Restores files in your working directory to a previous state, either from the staging area or from a specific commit. It is the modern and safer alternative to `git checkout -- <file-name>` for discarding changes.

#### **Syntax**

git restore <file-name>

git restore --staged <file-name>

git restore --source=<commit-hash> <file-name>

#### **Key Flags**

- `--staged`: Restores a file from the working directory, effectively **unstaging** it and moving it back to the state of the last commit. This is the opposite of `git add`.
    
- `--source=<commit-hash>`: Restores a file to its state at a **specific commit** in your history, overwriting both the staged and working directory versions.
    
- `--worktree` (default): Restores a file in your working directory to its state in the staging area. This discards any un-staged changes.
    

#### **Example**

```bash
# Discards un-staged changes to 'login.md'
# The file is restored to the state of the staging area
git restore login.md

# Unstages 'login.md' and restores it to its state from the last commit
git restore --staged login.md

# Discards all changes to 'login.md' and restores it to the state from commit '4f88169'
git restore --source=4f88169 login.md
```

#### **Related Commands**

- **`git checkout`**: The older command used for switching branches and discarding file changes. `git checkout -- <file-name>` is now better replaced by `git restore <file-name>`.
    
- **`git reset`**: A more powerful command that can unstage files, but its primary purpose is to move the branch's `HEAD` pointer. `git reset <file-name>` is functionally similar to `git restore --staged <file-name>`.
    
- **`git add`**: The opposite of `git restore --staged`, as it moves a file from the working directory to the staging area.