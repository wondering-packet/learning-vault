#### **1. Merging fast-forward. [KB003 - Merge fast-forward](../KBs/KB003%20-%20Merge%20fast-forward.md)**

1. Checking current commit history & working on the feature/x branch
```bash
# current commit history
git log --oneline --graph --all  
# HEAD is at main means you are in main branch right now
*   4720f32 (HEAD -> main) Another - Merge branch 'feature/logout'  
...truncated output...
* | 6a01500 (origin/main) main: new features v2  
...truncated output...
* 4097e98 new repo for IaC
# creating & switching - feature/x branch
git switch -c feature/x
Switched to a new branch 'feature/x'
# creating a new file & commit
echo "x: beta feature" > beta.md  
git add .  
git commit -m "x: beta v1"  
[feature/x 30d04bb] x: beta v1  
1 file changed, 1 insertion(+)  
create mode 100644 beta.md  
# push is optional for this excercise 
git push -u origin feature/x  
Enumerating objects: 28, done.  
Counting objects: 100% (28/28), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (21/21), done.  
Writing objects: 100% (24/24), 2.35 KiB | 343.00 KiB/s, done.  
Total 24 (delta 10), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (10/10), completed with 2 local objects.  
remote:  
remote: Create a pull request for 'feature/x' on GitHub by visiting:  
remote:      https://github.com/wondering-packet/iac-git/pull/new/feature/x  
remote:  
To https://github.com/wondering-packet/iac-git.git  
* [new branch]      feature/x -> feature/x  
branch 'feature/x' set up to track 'origin/feature/x'.  
# making a change & a commit
echo "x: beta feature v2" >> beta.md  
git add .  
git commit -m "x: beta v2"  
[feature/x d290506] x: beta v2  
1 file changed, 1 insertion(+)  
# note:
	# 30d04bb & d290506 are our latest 2 commits for above 2 changes.
	# 4720f32 is where the main is at. notice main hasn't had any other commits.
git log --oneline --graph --all  
* d290506 (HEAD -> feature/x) x: beta v2  
* 30d04bb (origin/feature/x) x: beta v1  
*   4720f32 (main) Another - Merge branch 'feature/logout'  
...truncated output...
* | 6a01500 (origin/main) main: new features v2  
...truncated output...
* 4097e98 new repo for IaC
```
2. Merging
```bash
# merging; notice fast forward in output
# notice the main branch's pointer has moved from commit 4720f32 to d290506 (the last commit from feature/x)
git merge feature/x  
Updating 4720f32..d290506  
Fast-forward  
beta.md | 2 ++  
1 file changed, 2 insertions(+)  
create mode 100644 beta.md
```
3. Validating commit history & status
```bash
# checking commit history

# few things to learn here:
# 1. main, origin/feature/x are at d290506 commit.
# 2. origin/main (which is the remote main) is still at 6a01500 commit since we haven't pushed yet.
# 3. HEAD -> main ; this tells you that you are currently in main branch.
# 4. notice there is no new commit after the FF merge - this is the main distinction from a normal merge. the pointer on main has simply moved forward from 4720f32 to d290506.

git log --oneline --graph --all  
* d290506 (HEAD -> main, feature/x) x: beta v2  
* 30d04bb (origin/feature/x) x: beta v1  
*   4720f32 Another - Merge branch 'feature/logout'  
...truncated output...
* | 6a01500 (origin/main) main: new features v2  
...truncated output...
|/  
* 4097e98 new repo for IaC
```
4. Pushing
```bash
git push  
Enumerating objects: 5, done.  
Counting objects: 100% (5/5), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (2/2), done.  
Writing objects: 100% (3/3), 295 bytes | 295.00 KiB/s, done.  
Total 3 (delta 1), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (1/1), completed with 1 local object.  
To https://github.com/wondering-packet/iac-git.git  
6a01500..d290506  main -> main

# notice now origin/main has also moved to the commit d290506.

git log --oneline --graph --all  
* d290506 (HEAD -> main, origin/main, feature/x) x: beta v2  
* 30d04bb (origin/feature/x) x: beta v1  
*   4720f32 Another - Merge branch 'feature/logout'  
|\  
...truncated output...
|/  
* 4097e98 new repo for IaC
```

#### **2. Merging (true merge)**

1. Working on feature/login branch
```bash
# working on the feature/login branch
git switch feature/login  
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
git switch main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
# notice login file isn't here yet
ls  
hello.txt  x.txt  

# HEAD is currenlty at main since we are on main
# 3c86970 is the commit from our login branch <-- keep a note of this
# f1e6f88 is the commit from our main branch <-- keep a note of this
git log --oneline --graph --all  
* 3c86970 (origin/feature/login, feature/login) login: v1  
| *   f1e6f88 (HEAD -> main, origin/main, origin/feature/x, feature/x) Merge branch 'main' into feature/x  
| |\  
| | * 826dd10 main: added signature  
| |/  
|/|  
| * 821ce60 x: v3  
| * 2f11877 x: v2  
| * ee1a39f x: added v1  
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
hello.txt  login.md  x.txt  
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
# a new commit c3be76d has been created unlike fast-forward
# you can still see the commits 3c86970 & f1e6f88
# reading the graph:
	# graph always shows parent-child relationship
	# c3be76d is the parent for 3c86970 & f1e6f88 children
	# from parent, you can easily trace the child commits
git log --oneline --graph --all  
*   c3be76d (HEAD -> main, origin/main) Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login, feature/login) login: v1  
* |   f1e6f88 (origin/feature/x, feature/x) Merge branch 'main' into feature/x  
|\ \  
| * | 826dd10 main: added signature  
| |/  
* | 821ce60 x: v3  
* | 2f11877 x: v2  
* | ee1a39f x: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC  
```