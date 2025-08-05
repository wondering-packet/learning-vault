#### **1. Without stashing**
1. **Work on a branch**
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
# fyi, when i say work here i am just doing minimal file/text changes.
# in real world, work would mean something like fixing bugs, adding new features etc.
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
	# fyi: i forgot to stage my changes above (in branch x)
	# but either way, i will lose my changes if another commit happens.
git checkout main  
D       beta.md  # update to a tracked file; marked for deletion.
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
```
2. **Work on another branch**
```bash
# switching to another branch where we need to do some work.
# we will be making a commit here which will make us
# lose our work done on branch x earlier.
git checkout feature/login  
Switched to branch 'feature/login'  
Your branch is ahead of 'origin/feature/login' by 11 commits.  
(use "git push" to publish your local commits)  
# work in this branch
echo "login: this a login feature v2" >> login.md  
cat login.md  
login: this is a login feature v1  
login: this a login feature v2  
git add .  
# after the commit we lose our work done in branch x.
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
```
3. **Result when not stashing**
```bash
# notice switching to main isn't saying anything about our untracked files now.
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
# no untracked files.
git status  
On branch main  
Your branch is up to date with 'origin/main'.  
  
nothing to commit, working tree clean  
# beta2/3 gone.
ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
# you will see the same in x branch.
git checkout feature/x  
Switched to branch 'feature/x'  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
ls  
beta.md  hello.txt  login.md  logout.md  newlogout
```
#### 2. With Stashing
1. **Work on a branch**
```bash
git branch  
feature/login  
feature/logout  
feature/rebase  
* feature/x  # <-- branch we are going to work on.
main  
test/conflict  
# i have already worked on 2 files which you can see are currently untracked.
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
beta2.md  # untracked file
beta3.md  # utnracked file
  
nothing added to commit but untracked files present (use "git add" to track)  
# By default, `git stash` only saves changes to files that Git is already tracking.
# Since `beta2.md` and `beta3.md` are new, they are untracked.
# To include them in the stash, you can either stage them
# first with `git add .` (as I am doing below),
# or use the command `git stash -u` to include untracked files.
git add .  
# notice no longer showing up as untracked files.
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
	# however you can still see that commit hasn't been initiated yet!
Changes to be committed:  
(use "git restore --staged <file>..." to unstage)  
new file:   beta2.md  
new file:   beta3.md  
# stashing the staged files so my work is saved.
# you should use "git stash push -m "work on feature A"" to leave a message to this stash.
# i forgot to do that :)
git stash  
Saved working directory and index state WIP on feature/x: d290506 x: beta v2  
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
nothing to commit, working tree clean  
```
2. **Working on another branch**
```bash
# switching to another branch to do some work.
git checkout feature/login  
Switched to branch 'feature/login'  
Your branch is up to date with 'origin/feature/login'.  
echo "login: this a login feature v3" >> login.md  
git add .  
git commit -m "login: added v3"  
[feature/login f13cc3e] login: added v3  
1 file changed, 1 insertion(+)  
# back to our branch x.
git checkout feature/x  
Switched to branch 'feature/x'  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
git status  
# notice how staged changes are not showing up!
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
nothing to commit, working tree clean  
# listing saves stashes.
# this is why i should have added a message with my stash
# makes it easier to recoginze my stash
```
3. **Stash list/pop/apply**
```bash
git stash list  
stash@{0}: WIP on feature/x: d290506 x: beta v2  
# popping a saved stash; by default loads the latest stash.
# NOTE pop means apply the latest stash & drop it.
# if you wanna keep the stash then do "git stash apply" instead.
git stash pop  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Changes to be committed:  
(use "git restore --staged <file>..." to unstage)  
new file:   beta2.md  
new file:   beta3.md  
  
Dropped refs/stash@{0} (255e231c67c47153c9b42d65017e0f350391a635)  # dropped
# now look at the status, we have our staged chages showing up.
git status  
On branch feature/x  
Your branch is ahead of 'origin/feature/x' by 1 commit.  
(use "git push" to publish your local commits)  
  
Changes to be committed:  
(use "git restore --staged <file>..." to unstage)  
new file:   beta2.md  
new file:   beta3.md  
```
4. **Commit & Push**
```bash
# commit & push.
git commit -m "x: added beta 2 & beta 3"  
[feature/x bd6398e] x: added beta 2 & beta 3  
2 files changed, 2 insertions(+)  
create mode 100644 beta2.md  
create mode 100644 beta3.md  
git push  
Enumerating objects: 5, done.  
Counting objects: 100% (5/5), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (2/2), done.  
Writing objects: 100% (4/4), 358 bytes | 358.00 KiB/s, done.  
Total 4 (delta 1), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (1/1), completed with 1 local object.  
To https://github.com/wondering-packet/iac-git.git  
30d04bb..bd6398e  feature/x -> feature/x
```