#### **Command**

`git reset`

#### **Purpose**

Undoes changes by moving the current branch pointer (`HEAD`) to a specified commit. It can also be used to unstage changes.

#### **Syntax**

git reset <commit-hash>

git reset --<mode> <commit-hash>

#### **Key Flags & Modes**

- **`--soft`**: Moves `HEAD` to the specified commit but **keeps your changes staged**. The changes are in the index, ready to be re-committed.
    
- **`--mixed` (default)**: Moves `HEAD` to the specified commit and **unstages your changes**, leaving them in your working directory. This is the default mode if no flag is specified.
    
- **`--hard`**: Moves `HEAD` to the specified commit and **discards all changes** in both your staging area and working directory. This mode is destructive and should be used with extreme caution.
    
- `--`: When used with a file path, it unstages the file without changing the branch's history. `git reset <file-name>` is a common shortcut for `git reset --mixed <file-name>`.
    

#### **Example**

```bash
# Moves HEAD back one commit, keeping all changes staged (--soft)
git reset HEAD~1 --soft

# Moves HEAD back one commit, unstaging all changes (default)
git reset HEAD~1

# Discards all changes and moves HEAD back to the specified commit
# WARNING: This deletes your work!
git reset <commit-hash> --hard

# Unstages a specific file, leaving the changes in your working directory
git reset <file-name>
```

#### **Related Commands**

- **`git revert`**: Creates a new commit that undoes the changes of a previous commit. This is a safer alternative to `git reset` for public history because it doesn't rewrite history.
    
- **`git checkout`**: Can be used to discard changes to a specific file in the working directory (`git checkout -- <file>`) but doesn't affect the staging area.
    
- **`git add`**: The opposite of `git reset <file>`, as it moves changes from the working directory to the staging area.