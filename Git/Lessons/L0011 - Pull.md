# Git Pull vs Git Pull --rebase

## **1. What `git pull` Does**
`git pull` is essentially two commands in one:
```bash
git fetch
git merge origin/<current_branch>
```
- **Fetches** the latest changes from the remote branch.
- **Merges** them into your current branch.
- If there are no conflicts, this creates a **merge commit** when the histories diverge.

**Example:**
```plaintext
A---B---C (origin/main)
     \
      D---E (main)
```
After `git pull`:
```plaintext
A---B---C------M (main)
     \       /
      D---E-- (merge commit)
```

### ✅ Pros:
- Keeps complete history of how merges happened.
- Simple for beginners.

### ❌ Cons:
- Adds merge commits that can clutter history.
- History can become harder to read.

---

## **2. What `git pull --rebase` Does**
`git pull --rebase` replaces the merge step with a **rebase**:
```bash
git fetch
git rebase origin/<current_branch>
```
- Fetches the latest remote changes.
- Temporarily **removes** your local commits.
- **Replays** your commits on top of the fetched commits.

**Example:**
```plaintext
A---B---C (origin/main)
     \
      D---E (main)
```
After `git pull --rebase`:
```plaintext
A---B---C---D'---E' (main)
```
(Note: `D'` and `E'` are the same changes as D and E, but with new commit IDs.)

### ✅ Pros:
- Keeps history **linear** and clean.
- Easier to follow project history.
- Avoids unnecessary merge commits.

### ❌ Cons:
- Changes commit IDs (rewrites history).
- Can be more complex if conflicts happen during rebase.

---

## **3. Which Should You Use?**
- **Use `git pull --rebase`** if:
  - You want a clean, linear commit history.
  - You’re comfortable resolving rebase conflicts.
  - Your team follows a rebase-based workflow.

- **Use `git pull` (merge)** if:
  - You want to preserve all merge history.
  - You’re working with beginners or a merge-heavy workflow.

---

## **4. Golden Rules When Rebasing**
- **Never rebase public/shared branches** that others are working on.
- Always rebase **before pushing** changes to keep remote clean.

---

## **5. Quick Commands**
```bash
git config --global pull.rebase true      # Make pull always rebase by default
git pull --rebase                         # One-time rebase pull
git pull                                  # Default pull (merge)
```

---

**Summary Table:**

| Command            | History Style      | Creates Merge Commit? | Changes Commit IDs? |
|--------------------|--------------------|------------------------|----------------------|
| `git pull`         | Branchy            | ✅ Yes                 | ❌ No               |
| `git pull --rebase`| Linear             | ❌ No                  | ✅ Yes              |
