# Interactive Rebase & Squashing in Git

Interactive rebase lets you rewrite commit history in a powerful and controlled way. It’s mostly used before merging a feature branch to clean things up.

---

## 🔎 What is Interactive Rebase?

- Lets you rewrite commit history.
- Common uses:
    - Squash multiple commits into one.
    - Reorder commits.
    - Edit commit messages.

> **Why Squash?**
> - Keeps history **clean & meaningful**
> - Avoids clutter from “WIP” commits
> - 📚 KB: [KB010 - Squashing](../KBs/KB010%20-%20Squashing.md)
> - 🧪 Exercise: [E004 - Squashing with Interactive Rebase](../Exercises/E004%20-%20Squashing%20with%20Interactive%20Rebase.md)

---

## ❗ Rewriting History Warning

> **Do NOT rebase shared branches**  
> Rebasing rewrites history. If others have already pulled the branch:
>
> - ❌ You’ll overwrite other people’s work
> - ❌ You’ll cause unnecessary merge conflicts
> - ✅ Only rebase **your own feature branches**

---

## 🔧 1. Start an Interactive Rebase

```bash
git rebase -i HEAD~<n>   # Edit last n commits
```

You’ll see:
```
pick 123abc First commit
pick 456def Second commit
pick 789ghi Third commit
```

---

## ✏️ 2. Commands in the Editor

| **Keyword** | **Meaning**                          |
|-------------|---------------------------------------|
| `pick`      | Keep commit as-is                     |
| `reword`    | Edit commit message                   |
| `edit`      | Pause to change the commit’s content  |
| `squash`    | Combine with commit above             |
| `fixup`     | Combine + discard this commit message |
| `drop`      | Delete the commit                     |

---

## 🧪 3. Squashing Commits

```bash
pick 123abc Add feature skeleton
squash 456def Add tests for feature
```

Then you’ll be prompted to edit the combined commit message.

---

## 📝 4. Rewording Commits

```bash
reword 123abc Fix typo in README
```

Git opens your editor to update the message.

---

## 🛠️ 5. Editing Commits

```bash
edit 123abc Update config settings
```

Then:
```bash
# Make changes
git add .
git commit --amend
git rebase --continue
```

---

## 🗑️ 6. Dropping Commits

```bash
drop 456def This commit is trash
```

---

## 🚦 7. Managing Rebase State

### Continue or Abort:
```bash
git rebase --continue
git rebase --abort
```

### Required After Rebase:
```bash
git push origin <branch> --force
```

> Force-push is required if you changed commit history.

---

## 🧠 TL;DR – Rebase Cheat Sheet

| **Action**              | **Command / Keyword**               |
|-------------------------|-------------------------------------|
| Start rebase            | `git rebase -i HEAD~n`              |
| Keep commit             | `pick`                              |
| Change message          | `reword`                            |
| Edit content            | `edit`                              |
| Combine commits         | `squash`, `fixup`                   |
| Delete commit           | `drop`                              |
| Continue rebase         | `git rebase --continue`             |
| Abort rebase            | `git rebase --abort`                |
| Force push (after rebase)| `git push origin <branch> --force` |

---

Interactive rebase is your best tool for making your Git history polished and professional — just be careful not to rewrite public/shared history!