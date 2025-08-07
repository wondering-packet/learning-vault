#### **Task 1: Modify Without Staging**
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
# staged it
git add demo.txt  
# commiting; note that now this file is tracked by git.
git commit -m "test/undo: demo v1"  
[test/undo e61ee9e] test/undo: demo v1  
1 file changed, 1 insertion(+)  
create mode 100644 demo.txt  
# making a change
echo "line2" >> demo.txt  
# restoring the file to the state it was in last commit.
# this will effectively remove "line2" from demo.txt file.
git restore demo.txt  
# adding "line2" again
echo "line2" >> demo.txt  
cat demo.txt  
line1  
line2  
git restore demo.txt  
cat demo.txt  
line1  
echo "line3" >> demo.txt  
git add demo.txt  
cat demo.txt  
line1  
line3  
git status  
On branch test/undo  
Changes to be committed:  
(use "git restore --staged <file>..." to unstage)  
modified:   demo.txt  
  
git restore --staged demo.txt  
git status  
On branch test/undo  
Changes not staged for commit:  
(use "git add <file>..." to update what will be committed)  
(use "git restore <file>..." to discard changes in working directory)  
modified:   demo.txt  
  
no changes added to commit (use "git add" and/or "git commit -a")  
echo "bad line" >> demo.txt  
git add demo.txt  
git commit -m "test/undo: bad commit v1"  
[test/undo a2e33f8] test/undo: bad commit v1  
1 file changed, 2 insertions(+)  
git log --oneline  
a2e33f8 (HEAD -> test/undo) test/undo: bad commit v1  
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
git reset --soft HEAD~1  
git log --oneline  
e61ee9e (HEAD -> test/undo) test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
echo "garbage" >> demo.txt  
git add .  
git commit -m "test/undo: garbage added"  
[test/undo 5a01504] test/undo: garbage added  
1 file changed, 3 insertions(+)  
git log --oneline  
5a01504 (HEAD -> test/undo) test/undo: garbage added  
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
git reset --hard HEAD~1  
HEAD is now at e61ee9e test/undo: demo v1  
cat demo.txt  
line1  
git status  
On branch test/undo  
nothing to commit, working tree clean  
echo "temp data" > temp.log  
git status  
On branch test/undo  
Untracked files:  
(use "git add <file>..." to include in what will be committed)  
temp.log  
  
nothing added to commit but untracked files present (use "git add" to track)  
git clean -fdn  
Would remove temp.log  
git clean -fd  
Removing temp.log  
echo "bad code" >> demo.txt  
cat demo.txt  
line1  
bad code  
git add .  
git commit -m "test/undo: v3"  
[test/undo a4a8caf] test/undo: v3  
1 file changed, 1 insertion(+)  
git log --oneline  
a4a8caf (HEAD -> test/undo) test/undo: v3  
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
git revert a4a8caf  
[test/undo 044360d] Revert "test/undo: v3" apologies: i accidentally added bad code in last commit! reverting with this commit.  
1 file changed, 1 deletion(-)  
cat demo.txt  
line1  
git log --oneline  
044360d (HEAD -> test/undo) Revert "test/undo: v3" apologies: i accidentally added bad code in last commit! reverting with this commit.  
a4a8caf test/undo: v3  
e61ee9e test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
git reset --hard HEAD~4  
HEAD is now at 45e73eb test/undo: commit v2  
git log --oneline  
45e73eb (HEAD -> test/undo) test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC  
ls  
hello.txt  logout.txt  test  
cat test  
test/undo: test text v1  
test/undo: test text v2  
git reflog  
45e73eb (HEAD -> test/undo) HEAD@{0}: reset: moving to HEAD~4  
044360d HEAD@{1}: revert: Revert "test/undo: v3"  
a4a8caf HEAD@{2}: commit: test/undo: v3  
e61ee9e HEAD@{3}: reset: moving to HEAD~1  
5a01504 HEAD@{4}: commit: test/undo: garbage added  
e61ee9e HEAD@{5}: reset: moving to HEAD~1  
a2e33f8 HEAD@{6}: commit: test/undo: bad commit v1  
e61ee9e HEAD@{7}: commit: test/undo: demo v1  
16505b8 HEAD@{8}: checkout: moving from 87b2e61be5b59ab6d8a9e8ea752ceca191a8ba31 to test/undo  
87b2e61 HEAD@{9}: checkout: moving from test/undo to 87b2e61  
16505b8 HEAD@{10}: revert: Revert "test/undo: commit v2"  
45e73eb (HEAD -> test/undo) HEAD@{11}: commit: test/undo: commit v2  
b9aea0c HEAD@{12}: reset: moving to HEAD~1  
87b2e61 HEAD@{13}: commit: test/undo: commit v3  
b9aea0c HEAD@{14}: reset: moving to HEAD~1  
e695154 HEAD@{15}: commit: test/undo: commit v2  
b9aea0c HEAD@{16}: reset: moving to HEAD~1  
26bd8b2 HEAD@{17}: commit (amend): test/undo: commit v2.1  
1f4ff59 HEAD@{18}: commit: test/undo: commit v2  
b9aea0c HEAD@{19}: commit: test/undo: commit v1  
ee1a39f HEAD@{20}: checkout: moving from main to test/undo  
475d847 (main) HEAD@{21}: checkout: moving from feature/x to main  
3b06249 (feature/x) HEAD@{22}: checkout: moving from feature/login to feature/x  
fe86d9c (feature/login) HEAD@{23}: commit (amend): login: fixed hotfixes :) v1 [ammended the message]  
ae9792d HEAD@{24}: commit (amend): login: fixed hotfixes :) v1  
6be7b1d HEAD@{25}: commit (amend): login: fixing hotfixes :) [beta]  
a2cc167 (tag: v13, origin/feature/login) HEAD@{26}: checkout: moving from feature/x to feature/login  
3b06249 (feature/x) HEAD@{27}: checkout: moving from main to feature/x  
475d847 (main) HEAD@{28}: checkout: moving from test/x to main  
3b06249 (feature/x) HEAD@{29}: checkout: moving from feature/x to test/x  
3b06249 (feature/x) HEAD@{30}: checkout: moving from main to feature/x  
475d847 (main) HEAD@{31}: checkout: moving from feature/x to main  
3b06249 (feature/x) HEAD@{32}: rebase (finish): returning to refs/heads/feature/x  
3b06249 (feature/x) HEAD@{33}: rebase (squash): x: beta4 final release v2  
d965a2a HEAD@{34}: rebase (pick): x: beta4 v2.0  
be285b9 HEAD@{35}: rebase (squash): x: beta4 final release  
8757d42 HEAD@{36}: rebase (squash): # This is a combination of 2 commits.  
e089b0f HEAD@{37}: rebase (start): checkout 1aab5ac  
1cb585c (tag: v2.2) HEAD@{38}: rebase (abort): returning to refs/heads/feature/x  
1aab5ac (origin/feature/x) HEAD@{39}: rebase (start): checkout 1aab5ac  
1cb585c (tag: v2.2) HEAD@{40}: commit: x: beta4 v2.2  
7c7c005 HEAD@{41}: commit: x: beta4 v2.0  
099e0d6 HEAD@{42}: commit: x: beta4 v1.2  
48f3f22 HEAD@{43}: commit: x: beta4 v1.1  
e089b0f HEAD@{44}: commit: x: beta4 v1  
1aab5ac (origin/feature/x) HEAD@{45}: rebase (finish): returning to refs/heads/feature/x  
1aab5ac (origin/feature/x) HEAD@{46}: rebase (squash): x: squash-testing: added beta 2 & beta 3  
d472b0a HEAD@{47}: rebase (squash): # This is a combination of 2 commits.  
30d04bb HEAD@{48}: rebase (start): checkout HEAD~3  
bd6398e HEAD@{49}: checkout: moving from feature/login to feature/x  
git checkout e61ee9e  
Note: switching to 'e61ee9e'.  
  
You are in 'detached HEAD' state. You can look around, make experimental  
changes and commit them, and you can discard any commits you make in this  
state without impacting any branches by switching back to a branch.  
  
If you want to create a new branch to retain commits you create, you may  
do so (now or later) by using -c with the switch command. Example:  
  
git switch -c <new-branch-name>  
  
Or undo this operation with:  
  
git switch -  
  
Turn off this advice by setting config variable advice.detachedHead to false  
  
HEAD is now at e61ee9e test/undo: demo v1  
git log --oneline  
e61ee9e (HEAD) test/undo: demo v1  
16505b8 Revert "test/undo: commit v2"  
45e73eb (test/undo) test/undo: commit v2  
b9aea0c test/undo: commit v1  
ee1a39f logout: added v1  
458eafb main: readme.md  
4097e98 new repo for IaC
```