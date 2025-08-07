#### **1. Modify Without Staging**
```bash
git branch  
feature/login  
feature/login-hotfix  
feature/logout  
feature/rebase  
feature/x  
main  
* test/undo  
# creating a new file
echo "line1" > demo.txt  
git add demo.txt  # staged
# commiting; note that now this file is tracked by git.
git commit -m "test/undo: demo v1"  
[test/undo e61ee9e] test/undo: demo v1  
1 file changed, 1 insertion(+)  
create mode 100644 demo.txt  
# making a change; no staging.
echo "line2" >> demo.txt  
# discarding changes (that haven't been staged!)
# this will effectively remove "line2" from demo.txt file.
git restore demo.txt  
cat demo.txt  
line1  # "line2" gone.
```

#### **2. Stage a File Then Unstage It**

```bash
# making another change; staging.
echo "line3" >> demo.txt  
git add demo.txt  
cat demo.txt  
line1  
line3  
git status  
On branch test/undo  
Changes to be committed:  
(use "git restore --staged <file>..." to unstage)  
modified:   demo.txt  # notice it's listed under changes which means staged

# Unstaging a file; changes are retained.
git restore --staged demo.txt  
git status  
On branch test/undo  
Changes not staged for commit:  
(use "git add <file>..." to update what will be committed)  
(use "git restore <file>..." to discard changes in working directory)  
modified:   demo.txt  # notice it's showing up under "not staged".
  
no changes added to commit (use "git add" and/or "git commit -a")  
```

> [!info]
> **you can break down above 2 tasks into:**
> 1. are changes not staged? YES - do git restore <file_name>
> 2. are changes staged? YES - do git restore --staged <file_name>
> 3. you want to undo changes that have been staged already?
> 	- do 2 then 1.

#### **3. Make a Bad Commit**

```bash
# let's make a bad commit with bad code
echo "bad line" >> demo.txt  
git add demo.txt  # staged
git commit -m "test/undo: bad commit v1"  # commited
[test/undo a2e33f8] test/undo: bad commit v1  
1 file changed, 2 insertions(+)  
# let's check history
git log --oneline  
a2e33f8 (HEAD -> test/undo) test/undo: bad commit v1  # here is our commit
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
# let's do a soft reset
	# which means undo commit, keep the file staged & in working directory. 
git reset --soft HEAD~1  
git log --oneline  
e61ee9e (HEAD -> test/undo) test/undo: demo v1  # notice a2e33f8 is gone!
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
```

### **4. Reset All Changes Harshly**

```bash
# let's add some code we never should've added; garbage code.
echo "garbage" >> demo.txt  
git add .  
git commit -m "test/undo: garbage added"  
[test/undo 5a01504] test/undo: garbage added  
1 file changed, 3 insertions(+)  
git log --oneline  
5a01504 (HEAD -> test/undo) test/undo: garbage added  # commit ID: 5a01504
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
# let's do a hard reset
	# which means undo commit, unstage the file & remove it from working directory
git reset --hard HEAD~1  
HEAD is now at e61ee9e test/undo: demo v1  # head moved back. 5a01504 gone!
cat demo.txt  
line1  # notice "garbage" line is gone from the file.
```

#### **5. Untracked Junk Cleanup**

```bash
# let's add some temp data.
# note that this is a different file so it's not tracked yet.
echo "temp data" > temp.log  
git status  
On branch test/undo  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
temp.log  # untracked
  
nothing added to commit but untracked files present (use "git add" to track) 

# "git clean" is used to remove all untracked files.
git clean -fdn  # used to confirm what will be removed!
Would remove temp.log  # file name
git clean -fd  # actually removing it
Removing temp.log  
```

#### **6. Revert a Commit**

```bash
# let's assume we accidently added a bad code
echo "bad code" >> demo.txt  
cat demo.txt  
line1  
bad code  
git add .  
git commit -m "test/undo: v3"  
[test/undo a4a8caf] test/undo: v3  
1 file changed, 1 insertion(+)  
git log --oneline  
a4a8caf (HEAD -> test/undo) test/undo: v3  # commit ID: a4a8caf
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
# now we want to revert the last commit which had our bad code
# "revert" creates a new commit with the changes by the latest commit undone.
git revert a4a8caf  
# you will be asked to enter a commit message!
[test/undo 044360d] Revert "test/undo: v3" apologies: i accidentally added bad code in last commit! reverting with this commit.  
1 file changed, 1 deletion(-)  
cat demo.txt  
line1  # bad code gone!
git log --oneline  
# a4a8caf commit is still there
# 044360d is the commit created by revert.
# effectively this new commit contains the same files as the commit e61ee9e.
044360d (HEAD -> test/undo) Revert "test/undo: v3" apologies: i accidentally added bad code in last commit! reverting with this commit.  
a4a8caf test/undo: v3  
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
```

#### **7. Accidentally Reset Too Far** (insert screaming emoji LoL)

```bash
# let's remove last 4 commits; hard means gone from staging & working directory.
git reset --hard HEAD~4  
HEAD is now at 45e73eb test/undo: commit v2  
git log --oneline  
# last 4 commits gone!
45e73eb (HEAD -> test/undo) test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
# you can see our newer files & content are gone.
ls  
hello.txt  logout.txt  test  
cat test  
test/undo: test text v1  
test/undo: test text v2  
# How do you restore at this point?
# use "git reflog"; this lets you view commits which have been detached.
git reflog  
# here the first 4 commits you see are our commits we lost earlier.
45e73eb (HEAD -> test/undo) HEAD@{0}: reset: moving to HEAD~4  
044360d HEAD@{1}: revert: Revert "test/undo: v3"  
a4a8caf HEAD@{2}: commit: test/undo: v3  
e61ee9e HEAD@{3}: reset: moving to HEAD~1  # let's look at this one
5a01504 HEAD@{4}: commit: test/undo: garbage added  
e61ee9e HEAD@{5}: reset: moving to HEAD~1  
a2e33f8 HEAD@{6}: commit: test/undo: bad commit v1  
e61ee9e HEAD@{7}: commit: test/undo: demo v1  
....truncated output....
bd6398e HEAD@{49}: checkout: moving from feature/login to feature/x  
# specify our commit
git checkout e61ee9e  
Note: switching to 'e61ee9e'.  
  # git will greet you with a good explanation
You are in 'detached HEAD' state. You can look around, make experimental  
changes and commit them, and you can discard any commits you make in this  
state without impacting any branches by switching back to a branch.  
  
If you want to create a new branch to retain commits you create, you may  
do so (now or later) by using -c with the switch command. Example:  
  
git switch -c <new-branch-name>  
  
Or undo this operation with:  
  
git switch -  
  
Turn off this advice by setting config variable advice.detachedHead to false  
  
HEAD is now at e61ee9e test/undo: demo v1  # confirms we are now indeed at e61ee9e
# below you can see HEAD has moved
git log --oneline  
e61ee9e (HEAD) test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb (test/undo) test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC
# at this point, you have the ability to look at your files from that commit.
# if you wish to restore - then you first need to create a new branch out of it.
# then you will merge with your test/undo branch.
ls  
demo.txt  hello.txt  logout.txt  test  # demo file is available now
cat demo.txt  
line1  # old content
# creating a new branch so we our commit in a real branch now
git switch -c test/undo-2  
Switched to a new branch 'test/undo-2'  
ls  
demo.txt  hello.txt  logout.txt  test  
cat demo.txt  
line1  
# you can now do your normal merge.
```