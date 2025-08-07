
#### **Command**

`git commit`

#### **Purpose**

Records the staged changes into the local repository. This creates a new, permanent snapshot of your project's state.

#### **Syntax**

git commit -m "<message>"

git commit -a -m "<message>"

git commit --amend

#### **Key Flags**

- `-m` or `--message`: Provides a commit message directly from the command line, without opening a text editor. This is the most common way to commit.
    
- `-a` or `--all`: Automatically stages all files that have been modified or deleted. It does **not** stage new, untracked files. This is a shortcut to combine `git add -u` and `git commit` into a single step.
    
- `--amend`: Replaces the last commit with a new commit. It combines any currently staged changes with the last commit's changes and allows you to change the commit message. This rewrites history and should only be used for local, unpushed commits.
    
- `--allow-empty`: Creates a commit even if there are no changes to any files. This is useful for marking milestones or creating a commit with only a message.
    

#### **Example**

```bash
# Stages all changes and commits them with a message
git add .
git commit -m "feat: add user login functionality"

# Stages all modified/deleted files and commits them in one step
git commit -a -m "refactor: improve performance of login module"

# Amends the last commit to add new changes and an updated message
git add login.md
git commit --amend -m "feat: add user login and fix validation bug"
```

#### **Related Commands**

- **`git add`**: Prepares changes for a commit by moving them to the staging area. You must run `git add` before `git commit` for any new or modified files.
    
- **`git push`**: Sends your committed changes from your local repository to a remote repository.
    
- **`git log`**: Displays the commit history of the repository, allowing you to see past commits.
    
- **`git status`**: Shows which files are currently in the working directory, staging area, and which are untracked.