
##### **We will be breaking this down into two real world scenarios:**

1. **Restoring a branch to a previous state:** you made some commits (good ones that implemented some new features) then you made some more commits (which accidentally broke new features) - Now you want to restore your work to how it was when the new features were working.
2. **Inspecting a Commit, Branching Off & Restoring a Specific Commit:** after a while later, you are asked to find out more about what changes in those new commits caused the new features to break So you decide to checkout one of the commits to explore the changes in detail. While you are exploring you realize there is a bug in this commit - you decide to fix the bug & replay this commit back to the branch. 

> We are skipping the PR process in this scenarios but in real-world there will of course be a proper review & approval before the fixed is implemented.

#### **1. Restoring a branch to a previous state**

1. Create a new branch & add some features:
```bash
git switch -c test/undo-4  
Switched to a new branch 'test/undo-4'  
echo "undo4: feature 1" > undo4  
git add .  
git commit -m "undo4: added feature 1"  
[test/undo-4 585eb96] undo4: added feature 1  
1 file changed, 1 insertion(+), 3 deletions(-)  
echo "undo4: feature 2" >> undo4  
git commit -am "undo4: feature 2"  
[test/undo-4 5083711] undo4: feature 2  
1 file changed, 1 insertion(+)  
echo "undo4: feature 3" >> undo4  
git commit -am "undo4: feature 3"  
[test/undo-4 b0ba17d] undo4: feature 3  
1 file changed, 1 insertion(+)  
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
```
2. Push - this is the first push to remote. I forgot to do this!
```bash
git push origin -u test/undo-4
```
2. (optional) work on some other branch to finish up some urgent task:
```bash
git switch main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 4 commits.  
(use "git push" to publish your local commits)  
echo "main: some other work on main branch" >> hello.txt  
git commit -am "main: some work after undo4 feature 3"  
[main 95568a8] main: some work after undo4 feature 3  
1 file changed, 1 insertion(+)  
```
3. Go back to feature branch to add some more features:
```bash
git switch test/undo-4  
Switched to branch 'test/undo-4'  
echo "undo4: feature 4 (no bugs)" >> undo4  
git commit -am "undo4: feature 4"  
[test/undo-4 fc8b001] undo4: feature 4  
1 file changed, 1 insertion(+)  
echo "undo4: feature 5 (contains a bug)" >> undo4  
git commit -am "undo4: feature 5"  
[test/undo-4 2e245db] undo4: feature 5  
1 file changed, 1 insertion(+)  
git log --oneline  
2e245db (HEAD -> test/undo-4) undo4: feature 5  
fc8b001 undo4: feature 4  
b0ba17d undo4: feature 3  
5083711 undo4: feature 2  
585eb96 undo4: added feature 1
..truncated output..
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug)  
```
4. Push - which i again forgot to do! (sigh..)

> Note that, this push contains a commits with buggy code.

5. Users testing these new features complain recent changes (made in this week) broke some core functionality so you decide to restore to the state of last week. Note that:
	1. to immediately bring back the working functionality (of course we will still be investigating the root cause in next scenario).
```bash
git reset --hard b0ba17d  
HEAD is now at b0ba17d undo4: feature 3  
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
git log --oneline  
b0ba17d (HEAD -> test/undo-4) undo4: feature 3  
5083711 undo4: feature 2  
585eb96 undo4: added feature 1
```
6. Push - 
7. Users confirm issue is no longer occuring.