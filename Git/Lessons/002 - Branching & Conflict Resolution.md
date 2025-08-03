#### Branches
- A branch is just a **pointer** to a commit.
- [^1]`main` (or `master`) is the default branch.
- Feature branches allow isolated development.

#### Merging
- Combines histories of two branches.
- **Fast-forward merge** → when main hasn’t moved since branch creation.
- **Merge commit** → when histories diverge.

#### Rebasing
- Moves your branch commits **on top of** another branch.
- Keeps history linear → no merge commits.
- Good for keeping a clean main history.

#### Conflicts
- Occur when Git can’t decide which changes to keep.
- **Conflict markers**:
	```plaintext
	<<<<<<< HEAD      # current branch’s code
	=======           # separator
    >>>>>>> 	branch    # other branch’s code
	```

- You must **manually edit**, then:
	```bash
	git add <filename>
	git rebase --continue
	# or
	git merge --continue
	```

#### Commands
1. Create & Switch Branch
	```bash
	git branch <branch_name>          # Create branch
	git checkout <branch_name>        # Switch to branch
	git checkout -b <branch_name>     # Create + switch in one step
	```
2. Merge
	```bash
	git checkout main
	git merge <branch_name>           # Merge into current branch
	```
3. Rebase
	```bash
	git checkout <feature_branch>
	git rebase main                   # Replay commits from feature branch on                                          # top of main
	```
4. **Resolve Merge Conflicts**
	- If a conflict occurs the file will have below conflict markers inside:
		```
		<<<<<<< HEAD
		changes from current branch
		=======
		changes from merging branch
        >>>>>>> 		branch_name_or_commit_id
		```
	- Steps to resolve:
		```bash
		# Step1, edit file, remove markers, keep correct code
		git add <file>                    # Step2, stage the file
		git rebase --continue             # Step3, continue rebase after                                                   # resolving
		```
5. Delete Branch
	```bash
	git branch -d <branch_name>       # Delete local branch (safe)
	git branch -D <branch_name>       # Force delete local branch
	git push origin --delete <branch> # Delete remote branch
	```

[^1]: [[KB-001 (Main or Master Branch)]]
