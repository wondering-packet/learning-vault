# Stashing, Pushing, Cherry-picking & Tagging in Git

These are utility Git tools used for common but powerful workflows — stashing changes, picking specific commits, sharing work, and marking versions.

---

## 📦 Stashing

- Temporarily saves changes **without committing**.
- Useful when you need to switch branches but have uncommitted work.
- Changes are saved in a stack-like stash list.

### 🔧 Commands:
```bash
git stash                          # Save changes temporarily
git stash list                     # View saved stashes
git stash pop                      # Reapply last stash & remove it
git stash apply                    # Reapply last stash & keep it in list
```

- 📚 KB: [KB005 - Stashing](../KBs/KB005%20-%20Stashing.md)  
- 🧪 Exercise: [E003a - Stashing](../Exercises/E003a%20-%20Stashing.md)

---

## 🍒 Cherry-picking

- Apply a **single commit** from another branch to your current branch.
- Keeps the original commit message (can be edited).
- Great for hotfixes or selectively backporting features.

### 🔧 Commands:
```bash
git log --oneline                  # Find commit ID
git cherry-pick <commit_id>        # Apply commit to current branch
```

- 📚 KB: [KB007 - Cherry-picking](../KBs/KB007%20-%20Cherry-picking.md)  
- 🧪 Exercise: [E003b - Cherry-picking](../Exercises/E003b%20-%20Cherry-picking.md)

---

## 🔖 Tagging

- Tags are used to mark important points (e.g. releases).
- Two types:
  - **Lightweight**: simple pointer to a commit
  - **Annotated**: includes message, author, timestamp

### 🔧 Commands:
```bash
git tag v1.0                       # Lightweight tag
git tag -a v1.0 -m "Version 1.0"   # Annotated tag
git push origin v1.0               # Push single tag
git push origin --tags             # Push all tags
```

- 📚 KB: [KB008 - Tags](../KBs/KB008%20-%20Tags.md)

---

## 🚀 Pushing Changes

Used to upload your local commits to a remote repository.

### 🔧 Commands:
```bash
git push origin <branch>           # Push branch to remote
git push -u origin <branch>        # Push & set upstream
```

---

These tools give you serious firepower to manage clean commits, share polished features, and prepare clean releases.