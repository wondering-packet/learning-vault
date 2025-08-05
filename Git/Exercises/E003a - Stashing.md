#### **1. Without stashing**
1. Work on a branch
```bash
# switch to working branch
git checkout feature/x  
Switched to branch 'feature/x'  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
# checking what we currently have
ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
# new work: adding a file
echo "x: a new beta feature v1" > beta2.md  
# switching back to main; optional 
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
ls  
# note that main can see beta2 because it exists in our local system now.
# it is however not part of main so if you goto github e.g. you won't see this.
beta2.md  beta.md  hello.txt  login.md  logout.md  newlogout  
# back to the working branch
git checkout feature/x  
Switched to branch 'feature/x'  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
# ignore the pending commit; notice git is saying we have untracked files.
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  # untracked file name
  
nothing added to commit but untracked files present (use "git add" to track)  
 
# let's do some more work; optional.
echo "x: feature 3" > beta3.md  
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
beta3.md  # another untracked file now
  
nothing added to commit but untracked files present (use "git add" to track)  
# some more work; optional.
rm beta.md  
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Changes not staged for commit:  
(use "git add/rm <file>..." to update what will be committed)  
(use "git restore <file>..." to discard changes in working directory)  
deleted:    beta.md  # added for deletion
# note that beta.md was already commited before we started this exercise
# so it's already tracked by git.
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
beta3.md  
  
no changes added to commit (use "git add" and/or "git commit -a")  
# back to main (see below message); optional.
# NOTE that so far we haven't made another commit in another branch.
# we will lose our changes as soon as a commit happens.
git checkout main  
D       beta.md  # update to a tracked file; marked for deletion.
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
# switching to another branch where we need to do some work.
# we will be creating a commit here which will make us
# lose our work done on branch x earlier.
git checkout feature/login  
Switched to branch 'feature/login'  
Your branch is ahead of 'origin/feature/login' by 11 commits.  
(use "git push" to publish your local commits)  
cat login.md  
login: this is a login feature v1  
echo "login: this a login feature v2" >> login.md  
cat login.md  
login: this is a login feature v1  
login: this a login feature v2  
git add .  
git commit -m "login: added v2"  
[feature/login cb5a1f4] login: added v2  
3 files changed, 3 insertions(+)  
create mode 100644 beta2.md  
create mode 100644 beta3.md  
git push  
Enumerating objects: 16, done.  
Counting objects: 100% (16/16), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (11/11), done.  
Writing objects: 100% (14/14), 1.20 KiB | 307.00 KiB/s, done.  
Total 14 (delta 4), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (4/4), done.  
To https://github.com/wondering-packet/iac-git.git  
3c86970..cb5a1f4  feature/login -> feature/login  
 
git status  
On branch feature/login  
Your branch is up to date with 'origin/feature/login'.  
  
nothing to commit, working tree clean  
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
git status  
On branch main  
Your branch is up to date with 'origin/main'.  
  
nothing to commit, working tree clean  
ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
git checkout feature/x  
Switched to branch 'feature/x'  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
ls  
beta.md  hello.txt  login.md  logout.md  newlogout
```
#### 2. With Stashing
1. Work on a branch
```bash

```