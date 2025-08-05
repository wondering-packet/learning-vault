#### **What Git Is**
- Git is a **distributed version control system** — every developer has the full history locally.
- Tracks changes to files over time.
- Allows collaboration and rollback.
#### **Local vs Remote**
- **Local repo** → your machine
- **Remote repo** → hosted service like GitHub, GitLab, Bitbucket
#### **Core States in Git**
- **Working Directory** – where you edit files.
- **Staging Area** – prepared changes ready to commit.
- **Repository** – committed history stored locally.
#### **Command Flow**
- Edit files → Working Directory  
- `git add` → Staging Area  
- `git commit` → Local Repository  
- `git push` → Remote Repository  
#### **Commands**
1. Create / Initialize a Repository
```bash
git init                          # Initialize new local repo
# OR
git clone <repo_url>              # Clone an existing remote repo
```
2. Configure Git
```bash
git config user.name "Your Name"
git config user.email "you@example.com"
```
3. Stage & Commit
```bash
git add <file>                    # Stage specific file
git add .                         # Stage all changes
git commit -m "Commit message"    # Commit staged changes
```
4. View History
```bash
git log                           # Detailed commit history
git log --oneline                 # Compact commit history
git log --oneline --graph --all   # Visual graph of all branches
```
5.  Pushing the new branch
```bash
# pushes the local branch to a new branch.
# if the branch doesn't exist then create one.
git push origin -u <branch_name> 
```

>    `-u` sets upstream so `git push` works without specifying branch.