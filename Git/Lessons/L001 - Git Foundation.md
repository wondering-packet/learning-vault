# Git Basics: What Git Is, Local vs Remote, Core States & Command Flow

Understanding how Git works under the hood helps build a strong foundation.

---

## 🧠 What Git Is

- Git is a **distributed version control system** — every developer has the full history locally.
- Tracks changes to files over time.
- Allows collaboration, rollback, and branching.

---

## 🖥️ Local vs 🌐 Remote

- **Local repository** → lives on your machine  
- **Remote repository** → hosted on GitHub, GitLab, Bitbucket, etc.

---

## ⚙️ Core States in Git

| **Area**             | **Description**                            |
|----------------------|--------------------------------------------|
| Working Directory    | Where you modify files                     |
| Staging Area (Index) | Prepares changes to be committed           |
| Repository           | Stores committed history locally           |

---

## 🔁 Command Flow

```
Edit → git add → git commit → git push
```

| **Action**   | **State Transition**       |
| ------------ | -------------------------- |
| Edit file    | Working Directory          |
| `git add`    | Moves to Staging Area      |
| `git commit` | Saves to Local Repository  |
| `git push`   | Sends to Remote Repository |

---

## 🛠️ Commands Summary

### 1. Create / Initialize Repository
```bash
git init                          # Initialize new local repo
git clone <repo_url>              # Clone existing remote repo
```

### 2. Configure Git Identity
```bash
git config user.name "Your Name"
git config user.email "you@example.com"
```

### 3. Stage & Commit Changes
```bash
git add <file>                    # Stage a specific file
git add .                         # Stage all changes
git commit -m "Your message"      # Commit staged changes
```

### 4. View Commit History
```bash
git log                           # Full commit details
git log --oneline                 # Compact log
git log --oneline --graph --all   # Visual graph of all branches
```

---

This foundation is key to mastering everything else in Git — from branching to rebasing to team workflows.