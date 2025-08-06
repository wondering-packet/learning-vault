#### **Branches**

- A branch is just a **pointer** to a commit.
- `main` (or `master`) is the default branch.
	- KB: [KB001 - Main or Master Branch](../KBs/KB001%20-%20Main%20or%20Master%20Branch.md).
- Feature branches allow isolated development.
#### **Merging**

- Combines histories of two branches.
- **Fast-forward merge** → when main hasn’t moved since branch creation.
	- Exercise: [E002b - Merging branch](../Exercises/E002b%20-%20Merging%20branch.md) Section 1.
	- KB: [KB003 - Merge fast-forward](../KBs/KB003%20-%20Merge%20fast-forward.md).
- **Merge commit** → when histories diverge.
	- Exercise: [E002b - Merging branch](../Exercises/E002b%20-%20Merging%20branch.md) Section 2.
#### **Rebasing**

- Moves your branch commits **on top of** another branch.
- Keeps history linear → no merge commits.
- Good for keeping a clean main history.
- KB: [KB004 - Rebase](../KBs/KB004%20-%20Rebase.md).
- Exercise: [E002c - Rebase](../Exercises/E002c%20-%20Rebase.md).
#### **Conflicts**

- Occur when Git can’t decide which changes to keep.
- **Conflict markers**:

	```plaintext
	<<<<<<< HEAD      # current branch’s code
	=======           # separator
    >>>>>>> 		branch    # other branch’s code
	```

	 You must **manually edit**, then:

	```bash
	git add <filename>
	git rebase --continue
	# or
	git merge --continue
	```
- KB: [KB006 - Conflict](../KBs/KB006%20-%20Conflict.md).
- Exercise: [E002d - Conflict](../Exercises/E002d%20-%20Conflict.md).
#### **Commands**
1. Create & Switch Branch
```bash
git branch <branch_name>          # Create branch
git checkout <branch_name>        # Switch to branch
git checkout -b <branch_name>     # Create + switch in one step
git branch                        # lists all branches; * remarks where you are
```
2. Merge
```bash
git checkout main
git merge <branch_name>           # Merge into current branch
```
3. Rebase
```bash
git checkout <feature_branch>
git rebase main                   # Replay commits from feature branch on top of main
```
4. Resolve Merge Conflicts
- If a conflict occurs the file will have below conflict markers inside:
```
<<<<<<< HEAD
changes from current branch
=======
changes from merging branch
>>>>>>> branch_name_or_commit_id
```
   - Steps to resolve:
```bash
# Step1, edit file, remove markers, keep correct code
nano <file>
# Step2, stage the file
git add <file>     
# Step3, continue rebase after resolving
git rebase --continue             
```
5.  Pushing the new branch
```bash
# pushes the local branch to a new branch.
# if the branch doesn't exist then create one.
git push origin -u <branch_name> 
```

>    `-u` sets upstream so `git push` works without specifying branch.

6. Delete Branch
```bash
git branch -d <branch_name>       # Delete local branch (safe)
git branch -D <branch_name>       # Force delete local branch
git push origin --delete <branch> # Delete remote branch
```
