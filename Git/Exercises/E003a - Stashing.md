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
# addi
echo "x: a new beta feature v1" > beta2.md  
 
cat beta2.md  
x: a new beta feature v1  
 
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
ls  
beta2.md  beta.md  hello.txt  login.md  logout.md  newlogout  
cat beta2.md  
x: a new beta feature v1  
git status  
On branch main  
Your branch is up to date with 'origin/main'.  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
  
nothing added to commit but untracked files present (use "git add" to track)  
git checkout feature/s  
error: pathspec 'feature/s' did not match any file(s) known to git  
git checkout feature/x  
Switched to branch 'feature/x'  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
  
nothing added to commit but untracked files present (use "git add" to track)  
 
git branch  
feature/login  
feature/logout  
feature/rebase  
* feature/x  
main  
test/conflict  
echo "x: feature 3" > beta3.md  
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
beta3.md  
  
nothing added to commit but untracked files present (use "git add" to track)  
 
rm beta  
beta2.md  beta3.md  beta.md  
rm beta  
beta2.md  beta3.md  beta.md  
rm beta.md  
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Changes not staged for commit:  
(use "git add/rm <file>..." to update what will be committed)  
(use "git restore <file>..." to discard changes in working directory)  
deleted:    beta.md  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
beta3.md  
  
no changes added to commit (use "git add" and/or "git commit -a")  
git checkout main  
D       beta.md  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
git status  
On branch main  
Your branch is up to date with 'origin/main'.  
  
Changes not staged for commit:  
(use "git add/rm <file>..." to update what will be committed)  
(use "git restore <file>..." to discard changes in working directory)  
deleted:    beta.md  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  
beta3.md  
  
no changes added to commit (use "git add" and/or "git commit -a")  
 
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