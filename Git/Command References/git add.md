#### **Command**

`git add`

#### **Purpose**

Adds changes from the working directory to the staging area (also known as the index). This prepares the changes for inclusion in the next commit.

#### **Syntax**

git add <file-name>

git add .

git add -p

#### **Key Flags**

- `.`: Stages all new, modified, and deleted files in the current directory and all subdirectories. It's a quick way to stage everything.
    
- `-A` or `--all`: Stages all changes, including deletions, from the entire repository. `git add .` is an alias for this command in the root of the repo.
    
- `-u` or `--update`: Stages modified and deleted files, but does **not** stage new, untracked files.
    
- `-p` or `--patch`: Starts an interactive session that allows you to review and stage changes in chunks (or "hunks"). This is useful for splitting up a single file's changes into multiple commits.
    

#### **Example**

```bash
# Stages a single, specific file
git add login.md

# Stages all changes in the current directory
git add .

# Stages only modified and deleted files, ignoring any new files
git add -u

# Stages changes to 'login.md' interactively, one hunk at a time
git add -p login.md
```

#### **Related Commands**

- **`git commit`**: Takes the staged changes and packages them into a new commit with a commit message. Changes must be staged with `git add` before they can be committed.
    
- **`git status`**: Shows the current state of the working directory and the staging area, including which files are staged, which are modified but not staged, and which are untracked.
    
- **`git reset`**: The opposite of `git add`, as it moves changes from the staging area back to the working directory, unstaging them. `git reset <file-name>` is the most common use.