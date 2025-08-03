#### **1. Merging fast-forward. [[KB003 (Merge fast-forward)]]**
1. Working on the feature/logout branch
```bash
# feature/logout branch
git checkout feature/logout  
Switched to branch 'feature/logout'  
Your branch is up to date with 'origin/feature/logout'.  
ls  
# we have added this logout.txt file
hello.txt  logout.txt

# main branch
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
ls  
# logout file not merged yet
hello.txt  
```
2. Merging
```bash
# merging; notice fast forward in output
git merge feature/logout  
Updating 826dd10..f1e6f88  
Fast-forward 
logout.txt | 1 +  
1 file changed, 1 insertion(+)  
create mode 100644 logout.txt  
# validate; logout file now added
ls  
hello.txt  logout.txt
```
3. Validating commit history & status
```bash
# checking commit history

# few things to learn here:
# 1. main, origin/feature/logout, feature/logout are at f1e6f88 commit.
# 2. origin/main (which is the remote main) is still at 826dd10 commit.
# 3. notice the text clearly stating merge source & target.
# 4. HEAD -> main ; this tells you that you are currently in main branch.
# 5. notice main hasn't had any new commits since the creation of feature/logout.
# 6. 4097e98 is the commit when feature/logout branch was created.
# 7. read the graph: all other commits are from branches.
git log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 (origin/main) main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC  
# you can also confirm this in status
git status  
On branch main  
Your branch is ahead of 'origin/main' by 5 commits.  
(use "git push" to publish your local commits)  
  
nothing to commit, working tree clean  
```
4. Pushing
```bash
git push  
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0  
To https://github.com/wondering-packet/iac-git.git  
826dd10..f1e6f88  main -> main  

# notice the major change:
# 1. now origin/main has also moved to the commit f1e6f88.
# 2. no new commit hash; we are doing a fast forward to the f1e6f88 commit.
# this is the key difference b/w a normal merge & ff merge.
git log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC
```

#### **2. Merging (true merge)**
1. Working on feature/login branch
```bash
# working on the feature/login branch
git checkout feature/login  
Switched to branch 'feature/login'  
echo "login: this is a login feature v1" > login.md  
ls  
hello.txt  login.md  
git add .  
git commit -m "login: v1"  
[feature/login 3c86970] login: v1  
1 file changed, 1 insertion(+)  
create mode 100644 login.md  

# this is my first push so i had set the upstream branch.
git push origin -u feature/login  
Enumerating objects: 4, done.  
Counting objects: 100% (4/4), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (2/2), done.  
Writing objects: 100% (3/3), 308 bytes | 308.00 KiB/s, done.  
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0  
remote:  
remote: Create a pull request for 'feature/login' on GitHub by visiting:  
remote:      https://github.com/wondering-packet/iac-git/pull/new/feature/login  
remote:  
To https://github.com/wondering-packet/iac-git.git  
* [new branch]      feature/login -> feature/login  
branch 'feature/login' set up to track 'origin/feature/login'.  
``````
2. Merging
```bash
# going back to main so we can perform a merge
git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
# notice login file isn't here yet
ls  
hello.txt  logout.txt  

# HEAD is currenlty at main since we are on main
# 3c86970 is the commit from our login branch
git log --oneline --graph --all  
* 3c86970 (origin/feature/login, feature/login) login: v1  
| *   f1e6f88 (HEAD -> main, origin/main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
| |\  
| | * 826dd10 main: added signature  
| |/  
|/|  
| * 821ce60 logout: v3  
| * 2f11877 logout: v2  
| * ee1a39f logout: added v1  
| * 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC  

# performing merge; notice there is no mention of "fast-forward"
git merge feature/login  
Merge made by the 'ort' strategy.  
login.md | 1 +  
1 file changed, 1 insertion(+)  
create mode 100644 login.md  
ls  
hello.txt  login.md  logout.txt  
```
3. Pushing
```bash
# pushing to update our remote origin/main
git push  
Enumerating objects: 4, done.  
Counting objects: 100% (4/4), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (2/2), done.  
Writing objects: 100% (2/2), 340 bytes | 340.00 KiB/s, done.  
Total 2 (delta 0), reused 0 (delta 0), pack-reused 0  
To https://github.com/wondering-packet/iac-git.git  
f1e6f88..c3be76d  main -> main  

# notice:
# a new commit has been created unlike fast-forward; c3be76d is the commit hash
# you can still see the commit 3c86970 from our login branch
git log --oneline --graph --all  
*   c3be76d (HEAD -> main, origin/main) Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login, feature/login) login: v1  
* |   f1e6f88 (origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
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