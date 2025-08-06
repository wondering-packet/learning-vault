#### **Stashing**

- Temporarily saves changes **without committing**.
- Use when you need to switch branches but have uncommitted work.
- `git stash` → save changes
- `git stash pop` → apply + remove from stash
- `git stash apply` → apply + keep in stash list
- KB: [[KB005 - Stashing]].
- Exercise: [[E003a - Stashing]]
#### **Cherry-picking**

- Apply a **single commit** from another branch to your current branch.
- Keeps the commit message (can be edited).
- Used for hotfixes, selective feature backports.
- KB: [[KB007 - Cherry-picking]].
- Exercise: [[E003b - Cherry-picking]]
#### **Tagging**

- **Lightweight tag** → just a pointer to a commit.
- **Annotated tag** → includes message, tagger name, date.
- Useful for releases.
- KB: [[KB008 - Tags]].
- KB: [Tags](../KBs/KB008%20-%20Tags.md)
#### **Commands**

1. Stash Changes
	```bash
	git stash                          # Save changes temporarily
	git stash list                     # View saved stashes
	git stash pop                      # Reapply last stash & remove it
	git stash apply                    # Reapply last stash & keep it in list
	```
2. Push Changes
	```bash
	git push origin <branch>           # Push branch to remote
	git push -u origin <branch>        # Push & set upstream
	```
3. Cherry-pick
	```bash
	git log --oneline                  # Find commit ID
	git cherry-pick <commit_id>        # Apply commit to current branch
	```
4. Tags
	```bash
	git tag v1.0                       # Lightweight tag
	git tag -a v1.0 -m "Version 1.0"   # Annotated tag
	git push origin v1.0               # Push single tag
	git push origin --tags             # Push all tags
	```