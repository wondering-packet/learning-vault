# Lesson 5 – Remote Workflows & Pull Requests

## 1. Cloning Repositories
- To work on an existing project, you first clone it from a remote.
```bash
git clone <repo_url>
```
- Creates a local copy with a link to the remote named **origin**.

---

## 2. Pushing Changes
- Push commits from your local branch to the remote.
```bash
git push origin <branch>
```
- To set an upstream (so `git push` works without branch name):
```bash
git push -u origin <branch>
```

---

## 3. Creating Branches for Features/Fixes
- Work on a separate branch before pushing:
```bash
git switch -c feature/new-feature
```
- Push it to the remote:
```bash
git push -u origin feature/new-feature
```

---

## 4. Pull Requests (PRs)
- A Pull Request is a way to **propose** your branch’s changes into another branch (commonly `main`).
- Happens on platforms like GitHub, GitLab, Bitbucket.
- Used for:
  - Code review
  - Automated testing
  - Approval workflow
- Merge Options in GitHub:
  1. **Merge Commit** – preserves history, adds a merge commit.
  2. **Squash & Merge** – combines all branch commits into one.
  3. **Rebase & Merge** – applies branch commits on top of base branch (linear history).

---

## 5. Rebasing Before PR
- Keeps history clean by moving your commits on top of the latest main branch **before pushing**.
```bash
git fetch origin
git switch feature/new-feature
git rebase origin/main
```
- Resolve conflicts if any:
```bash
# Edit files to fix conflicts
git add <file>
git rebase --continue
```
- After rebase, push with force (safe if branch is yours):
```bash
git push --force-with-lease
```

---

## 6. Resolving Conflicts from Remote
- Happens when your local branch and the remote branch have both changed.
- Pull with rebase to avoid merge commits:
```bash
git pull --rebase
```
- Resolve conflicts:
```bash
# Edit conflicting files
git add <file>
git rebase --continue
```
- If you need to abort:
```bash
git rebase --abort
```

---

## 7. Common Commands Reference
```bash
git fetch origin                      # Get latest refs from remote
git pull --rebase                      # Rebase local branch on top of remote
git push origin <branch>               # Push branch to remote
git push -u origin <branch>            # Push and set upstream
git rebase origin/main                  # Rebase on latest main branch
```

---

## Key Tips
- Always rebase before PR to keep history clean.
- Use `--force-with-lease` instead of `--force` to avoid overwriting others’ work.
- If working solo, you don’t need PRs—just push directly to `main` (but still rebase if working with a remote).
---

## Local vs GitHub Rebase/Squash

### **Local Rebase or Squash**
- You rewrite commit history **before** pushing changes to the remote repository.
- Benefits:
  - You have full control over the process (interactive rebase, squash selectively, reorder commits).
  - You can test the changes locally and ensure everything works before updating the remote branch.
  - Keeps the remote clean from extra commits like "fix typo" or "WIP".
- Downsides:
  - You need to force-push (`git push --force`) if rewriting history on a branch that has already been pushed.
  - If others are working on the same branch, force-pushing can cause conflicts and headaches.

### **GitHub Rebase or Squash via Pull Request**
- You push all your commits to the remote **as-is**, and during the PR merge, you choose:
  - **Rebase and merge** → applies your commits one-by-one on top of the target branch, creating a linear history.
  - **Squash and merge** → combines all commits from the PR into a single commit.
- Benefits:
  - No need for local force-pushes.
  - The final main branch history is clean, even if your feature branch had messy commits.
  - Good for team collaboration where others might pull your branch before merge.
- Downsides:
  - You lose fine-grained control over the commit structure unless you rebase/squash locally first.
  - Commit hashes will change at merge time, which can be confusing if you need to reference them later.

**In short:**  
- If you want to *curate* and *perfect* your commit history → **do it locally** before pushing.  
- If you just want a clean history without local cleanup hassle → **do it in GitHub** during the PR.