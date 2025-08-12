
##### **We will be breaking this down into two scenarios:**

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
# we've added 3 features (this is previous week)
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
# adding 2 more features this week, one of which contains a buggy code.
# i've just added (no bugs/contains a bug) for easier understanding,
# in real-world you will have to do troubleshooting to identify the bugs.
echo "undo4: feature 4 (no bugs)" >> undo4  
git commit -am "undo4: feature 4"  
[test/undo-4 fc8b001] undo4: feature 4  
1 file changed, 1 insertion(+)  
echo "undo4: feature 5 (contains a bug)" >> undo4  # buggy feature
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
# all features 
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug)  
```
4. Push - which i again forgot to do! (sigh..)

> Note that, this push contains a commits with buggy code.

5. Users testing these new features complain recent changes (made in this week) broke some core functionality so you immediately decide to restore to the state of last week. A few things to note:
	1. This is an emergency situation - highest priority is to restore the functionality this is why we are not doing much troubleshooting. Also, we already know of a working state.
	2. Why we are not using `git revert`? We absolutely can & it should actually be the preferred way, I am just doing  `git reset --hard` to demonstrate it's usage in this scenario.
	3. We will still be investigating the root cause in later (next scenario).
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
6. Push - a normal push will not work because of divergent history b/w local & remote (note that our remote still has all this week's commit)
```bash
git push --force-with-lease
```
6. Users confirm issue is no longer occurring.

#### **2. Inspecting a Commit, Branching Off & Restoring a Specific Commit**

1. Let's look identify the commits that might have caused problems for users:
```bash

```