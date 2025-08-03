#### 1. Check current commit history
```bash
git checkout main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 1 commit.  
(use "git push" to publish your local commits)  
# pointer for main is at 5cfa15d
git log --oneline --graph --all  
* 5cfa15d (feature/logout) logout: new feature v1  
| * 1b364ef (feature/login) login: new feature v3  
| * 0de1146 login: new feature v2  
| * 1da19b5 login: new feature v1  
|/  
* 4421ab9 (HEAD -> main) main: v2  
*   c3be76d (origin/main) Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login) login: v1  
* |   f1e6f88 (origin/feature/logout) Merge branch 'main' into feature/logout  
|\ \  
| * | 826dd10 main: added signature  
| |/  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC
```
#### 2. Create a new branch & make some commits
```bash
# new branch
git checkout -b feature/rebase  
Switched to a new branch 'feature/rebase'  
# creating some test files so we can perform a few commits
ls  
hello.txt  login.md  logout.txt  
echo "rebase: v1" > rebase  
git add .  
git commit -m "rebase: v1"  
[feature/rebase d70242d] rebase: v1  
1 file changed, 1 insertion(+)  
create mode 100644 rebase  
echo "rebase: v2" >> rebase  
git add .  
git commit -m "rebase: v2"  
[feature/rebase a751c39] rebase: v2  
1 file changed, 1 insertion(+)  
echo "rebase: v3" >> rebase  
git add .  
git commit -m "rebase: v3"  
[feature/rebase 4f88169] rebase: v3  
1 file changed, 1 insertion(+)
# commit history after 3 commits
# new commits are: d70242d -> a751c39 -> 4f88169 (latest)
# notice 5cfa15d is the last commit for main
git log --oneline --graph --all  
* 4f88169 (HEAD -> feature/rebase) rebase: v3  
* a751c39 rebase: v2  
* d70242d rebase: v1  
| * 5cfa15d (feature/logout) logout: new feature v1  
|/  
....
|/  
* 4097e98 new repo for IaC
```

> [!important]
> DO NOT push the new commits for the branch you are going to rebase.
> - **The Golden Rule of Rebase:** **Never rebase commits that you have already pushed to a public/shared remote repository and that other people might have pulled down.**
> - **Why?** Rebasing re-writes history by creating _new_ commits. If you push `feature/rebase` (containing commits A, B, C) and then rebase it locally (which creates new commits A', B', C'), your local branch now has a completely different history than the remote branch. When you then try to push again, Git will be confused, as the histories have diverged. You'd be forced to `git push --force`, which is dangerous because it overwrites the remote history and can cause major problems for anyone who has already pulled your original (A, B, C) commits.
#### 3. Switch back to Main & make a new commit so the current tip of Main changes (explained below)
```bash
git pull origin main   
git checkout main
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 1 commit.  
(use "git push" to publish your local commits) 
# adding a new commit so our pointer moves ahead of 4f88169 (last commit by feature/rebase)
echo "main: adding some features v2" >> hello.txt  
git add .  
git commit -m "main: new features v2"  
[main 6a01500] main: new features v2  
1 file changed, 1 insertion(+)
```

> [!important]
> Always pull your main before trying to rebase. This ensures your main is up-to-date i.e. any other commits by other people are pulled in.

#### 4. Rebase
```bash
# see the new commit 6a01500 is now ahead of 4f88169 (last commit by feature/rebase)
git log --oneline --graph --all  
* 6a01500 (HEAD -> main, origin/main) main: new features v2  
| * 4f88169 (origin/feature/rebase, feature/rebase) rebase: v3  
| * a751c39 rebase: v2  
| * d70242d rebase: v1  
|/  
| * 5cfa15d (feature/logout) logout: new feature v1  
|/  
....
|/  
* 4097e98 new repo for IaC  

# rebasing
git checkout feature/rebase  
Switched to branch 'feature/rebase'  
Your branch is up to date with 'origin/feature/rebase'.  
git rebase main  
Successfully rebased and updated refs/heads/feature/rebase.  

# few things to note:
# 1. see now there are 3 new commits on top of our last commit 6a01500
# 2. commits 040432a -> 72be6f5 -> 10659aa have been replayed from the original d70242d -> a751c39 -> 4f88169 commits (in feature/rebase)
# 3. d70242d -> a751c39 -> 4f88169 these commits have been detached & are no longer seen
git log --oneline --graph --all  
* 10659aa (HEAD -> feature/rebase) rebase: v3  
* 72be6f5 rebase: v2  
* 040432a rebase: v1  
* 6a01500 (origin/main, main) main: new features v2  
| * 4f88169 (origin/feature/rebase) rebase: v3  
| * a751c39 rebase: v2  
| * d70242d rebase: v1  
|/  
| * 5cfa15d (feature/logout) logout: new feature v1  
....
|/  
* 4097e98 new repo for IaC
# push all the commits
git push
```