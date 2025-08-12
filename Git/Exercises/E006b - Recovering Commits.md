#### **We will be breaking this down into two scenarios:**

1. **Restoring a branch to a previous state:** you made some commits (good ones that implemented some new features) then you made some more commits (which accidentally broke new features) - Now you want to restore your work to how it was when the new features were working.
2. **Inspecting a Commit, Branching Off & Restoring a Specific Commit:** after a while later, you are asked to find out more about what changes in those new commits caused the new features to break So you decide to checkout one of the commits to explore the changes in detail. While you are exploring you realize there is a bug in this commit - you decide to fix the bug & replay this commit back to the branch. 

> We are skipping the PR process in these scenarios but in real-world there will of course be a proper review & approval before the fixed is implemented.

#### **1. Restoring a branch to a previous state**

1. Create a new branch & add some features:

```bash
git switch -c test/undo-4  
Switched to a new branch 'test/undo-4'  
echo "undo4: feature 1" > undo4  
git add .  # tracking the file
git commit -m "undo4: added feature 1"  
[test/undo-4 585eb96] undo4: added feature 1  
1 file changed, 1 insertion(+), 3 deletions(-)  
echo "undo4: feature 2" >> undo4  
# -am stages all files & commits; only works if files are already tracked!
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

2. Push - this is the first push to remote. I forgot to do this, sorry!

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
# in real-world you will have to troubleshoot to identify the bugs.
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
# all features as of this week:
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug)  
```

4. Push - which i again forgot to do (sigh..!).

```bash
git push
```

> Note that, this push contains commits with buggy code.

5. Users testing these new features complain recent changes (made in this week) broke some core functionality so you immediately decide to restore to the state of last week. 

	A few things to note:
	
	1. This is an emergency situation - highest priority is to restore the functionality this is why we are not doing much troubleshooting. Also, we already know of a working state so it's much faster & easier to recover.
	2. Why we are not using `git revert`? We absolutely can & it should actually be the **preferred way**, I am just doing  `git reset --hard` to demonstrate it's usage in this scenario.
	3. We will still be investigating the root cause later (next scenario).

```bash
git reset --hard b0ba17d  # b0ba17d is the last commit from previous week
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

> [!important]
> Again, if you need to roll back in real world, you should ALWAYS do a revert instead which:
> 1. Preserves commit history.
> 2. Doesn't cause any divergence b/w local & remote (if commits are already pushed).
> 3. Safer for shared commits.
> 
> In this scnario, you will do:
>
>```bash
>git revert fc8b001 2e245db
> ```

4. Push - a normal push will not work because of divergent history b/w local & remote (note that our remote still has all this week's commit)

```bash
git push --force-with-lease
```

6. Users confirm issue is no longer occurring.

#### **2. Inspecting a Commit, Branching Off & Restoring a Specific Commit**

1. Let's look identify the commits that might have caused problems for users:

```bash
git reflog  
b0ba17d (HEAD -> test/undo-4, origin/test/undo-4) HEAD@{0}: reset: moving to b0ba17d  
2e245db HEAD@{1}: commit: undo4: feature 5  # commit 5 (this week) - investigate
fc8b001 HEAD@{2}: commit: undo4: feature 4  # commit 4 (this week)- investigate
b0ba17d (HEAD -> test/undo-4, origin/test/undo-4) HEAD@{3}: checkout: moving from main to test/undo-4  
95568a8 (main) HEAD@{4}: commit: main: some work after undo4 feature 3  
f621b44 HEAD@{5}: checkout: moving from test/undo-4 to main  
b0ba17d (HEAD -> test/undo-4, origin/test/undo-4) HEAD@{6}: commit: undo4: feature 3  # commit 3 (previous week)
5083711 HEAD@{7}: commit: undo4: feature 2  # commit 2 (previous week)
585eb96 HEAD@{8}: commit: undo4: added feature 1  # commit 1 (previous week)
```

2. Let's look investigate both commits:

```bash
# investigating commit 4:
git checkout fc8b001  
Note: switching to 'fc8b001'.  
  
You are in 'detached HEAD' state. You can look around, make experimental  
changes and commit them, and you can discard any commits you make in this  
state without impacting any branches by switching back to a branch.  
  
If you want to create a new branch to retain commits you create, you may  
do so (now or later) by using -c with the switch command. Example:  
  
git switch -c <new-branch-name>  
  
Or undo this operation with:  
  
git switch -  
  
Turn off this advice by setting config variable advice.detachedHead to false  
  
HEAD is now at fc8b001 undo4: feature 4 
# at this point you will be carrying out your investigation, testing, review etc.
# i am again just using a simple test here to show that this commit isn't buggy.
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  # no bugs
# investigating commit 5:
git checkout 2e245db  
Previous HEAD position was fc8b001 undo4: feature 4  
HEAD is now at 2e245db undo4: feature 5  
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (contains a bug)  # found a bug
```

3. Let's fix the bug & create a new branch:

```bash
# branching off so we have a real branch where we can create a new commit to cherry pick.
# NOTE that: you can directly implement a fix in the detached commit & then cherry pick it in the feature branch but it's highly recommened that you always # create a new branch because a new branch gives your commit/work a permanant
# place instead of it being in a detached state (where you can easily loose 
# track of it).
git switch -c test/undo-4-bugfix  
Switched to a new branch 'test/undo-4-bugfix' 
# fixing the bug
nano undo4  
# validate
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
undo4: feature 5 (bug fixed)  # bugfix implemented 
git add .  
git commit -m "undo-4-bugfix: fixed the bug in feature 5"  
[test/undo-4-bugfix 3ef07a6] undo-4-bugfix: fixed the bug in feature 5  
# note the commit hash 3ef07a6.
```

4. Let's cherry pick the non-buggy & fixed commits back into the feature branch:

```bash
# cherry-picking the non-buggy commit 4.
git cherry-pick fc8b001  
[test/undo-4 a95e420] undo4: feature 4  
Date: Tue Aug 12 20:01:45 2025 +0530  
1 file changed, 1 insertion(+)
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)
# cherry-picking the fixed commit 5; fixed commit's hash: 3ef07a6.
git cherry-pick 3ef07a6  
Auto-merging undo4  
CONFLICT (content): Merge conflict in undo4  
error: could not apply 3ef07a6... undo-4-bugfix: fixed the bug in feature 5  
hint: After resolving the conflicts, mark them with  
hint: "git add/rm <pathspec>", then run  
hint: "git cherry-pick --continue".  
hint: You can instead skip this commit with "git cherry-pick --skip".  
hint: To abort and get back to the state before "git cherry-pick",  
hint: run "git cherry-pick --abort".  
```

5. Fix conflicts:

```bash
# conflicts was expected because of new line in our file
cat undo4  
undo4: feature 1  
undo4: feature 2  
undo4: feature 3  
undo4: feature 4 (no bugs)  
<<<<<<< HEAD  
=======  
undo4: feature 5 (bug fixed)  
>>>>>>> 3ef07a6 (undo-4-bugfix: fixed the bug in feature 5)  
# fixing conflict
nano undo4  
# restaging
git add . 
# continue cherry-picking process
git cherry-pick --continue
..truncated output..
```