#### **1. Create a new branch, modify files from Main &  commit**

```bash
# creating a new branch
git checkout -b test/conflict-2  
Switched to a new branch 'test/conflict-2'  
# checking the contents of files we will be using to cause confict
ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
cat logout.md  
conflict: new conflict v2
# modifying the files by appending new data
echo "conflict-2 v1" >> logout.md 
echo "conflict-2 v1" >> login.md
cat logout.md  
conflict: new conflict v2  
conflict-2 v1  
cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
conflict-2 v1   
# staging & commiting. checkout the IMPORTANT note at the end.
git add .  
git commit -m "conflict-2: v1"  
[test/conflict-2 77be3c6] conflict-2: v1  
2 files changed, 2 insertions(+)
```
#### **2. Modify the files & commit in Main**

```bash
# back to main
git checkout main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 4 commits.  
(use "git push" to publish your local commits)  
git log --oneline --graph --all 
# note that main's pointer is at commit 1f6b3a6 right now.
# 7be3c6 is the last commit we have from previous step, it is ahead of main.
* 77be3c6 (test/conflict-2) conflict-2: v1  
*   1f6b3a6 (HEAD -> main) testing commit after fixing conflicts  
|\  
..truncating output..
|/  
* 4097e98 new repo for IaC  
# just validating main branch still has the old content.
cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
cat logout.md  
conflict: new conflict v2  
# modifying the content of files to cause conflict
# we need to modify the same files to cause conflict.
echo "main: new lines to login" >> login.md  
echo "main: new lines to logout" >> logout.md  
# staging & commiting. checkout the IMPORTANT note at the end.
git add .  
git commit -m "main: modified login & logout"  
[main 9f873cc] main: modified login & logout  
2 files changed, 2 insertions(+)  
git log --oneline --graph --all 
# 77be3c6 is the commit from the conflicting branch.
# 9f873cc is the commit from above commit.
* 9f873cc (HEAD -> main) main: modified login & logout  
| * 77be3c6 (test/conflict-2) conflict-2: v1  
..truncating output..
|/  
* 4097e98 new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$
```
#### **3. Merging**

```bash
# merging; note conflict errors - conflicting files are listed.
git merge test/conflict-2  
Auto-merging login.md  
CONFLICT (content): Merge conflict in login.md  
Auto-merging logout.md  
CONFLICT (content): Merge conflict in logout.md  
Automatic merge failed; fix conflicts and then commit the result.  
# each conflicting file will have the conflict markers.
cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
<<<<<<< HEAD  
main: new lines to login  # content in current branch (main)
=======  
conflict-2 v1  # content in branch being merged (test/conflict-2)
>>>>>>> test/conflict-2  # name of the branch that is conflicting with current branch (main)
cat logout.md  
conflict: new conflict v2  
<<<<<<< HEAD  
main: new lines to logout  
=======  
conflict-2 v1  
>>>>>>> test/conflict-2  
# fixing the conflicts; you have to remove the markers after resolving the conflicts.
nano login.md  
nano logout.md  
cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
Fixed conflict from conflict-2  
cat logout.md  
conflict: new conflict v2  
Fixed conflict from conflict-2  
# we now have to follow the usual process of staging.
git add . 
# up until this point the merge is at "in-prgress" stage
# to fully complete the merge, we need to do a special commit
# (called Merge commit since it is done after resolving conflicts from a merge) 
git commit -m "main: fixed conflict"  
[main b246101] main: fixed conflict  
git log --oneline --graph --all 
# notice the new commit b246101. this is parent.
# 77be3c6 is the commit from the conflicting branch. this is child 1.
# 9f873cc is the commit from the main branch. this is child 2.
*   b246101 (HEAD -> main) main: fixed conflict  
|\  
| * 77be3c6 (test/conflict-2) conflict-2: v1  
* | 9f873cc main: modified login & logout  
..truncating output..
|/  
* 4097e98 new repo for IaC
# lastly pushing our commit.
git push  
Enumerating objects: 30, done.  
Counting objects: 100% (30/30), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (23/23), done.  
Writing objects: 100% (26/26), 2.55 KiB | 372.00 KiB/s, done.  
Total 26 (delta 8), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (8/8), completed with 1 local object.  
To https://github.com/wondering-packet/iac-git.git  
729b1e5..b246101  main -> main
```
#### **4. Bonus**
```bash
# there are different types of Conflicts
# this one is a (modify/delete) confict
# it's saying our file "newlogin" does not exist in HEAD (current branch)
# but it exists in the commit 0de1146
# so basically since the file itself doesn't exist in one of the places
# there is no content to compare.
git cherry-pick 0de1146  
CONFLICT (modify/delete): newlogin deleted in HEAD and modified in 0de1146 (login: new feature v2).  Version 0de1146 (login: new feature v2) of newlogin left in tree.  
error: could not apply 0de1146... login: new feature v2  
hint: After resolving the conflicts, mark them with  
hint: "git add/rm <pathspec>", then run  
hint: "git cherry-pick --continue".  
hint: You can instead skip this commit with "git cherry-pick --skip".  
hint: To abort and get back to the state before "git cherry-pick",  
hint: run "git cherry-pick --abort".

# this one is a typical (content) conflict
git cherry-pick 61c242b  
Auto-merging login-hotfix  
CONFLICT (content): Merge conflict in login-hotfix  
error: could not apply 61c242b... login-hotfix: added hotfix v3  
hint: After resolving the conflicts, mark them with  
hint: "git add/rm <pathspec>", then run  
hint: "git cherry-pick --continue".  
hint: You can instead skip this commit with "git cherry-pick --skip".  
hint: To abort and get back to the state before "git cherry-pick",  
hint: run "git cherry-pick --abort".
```

> [!important]
> - A merge conflict can only happen when the histories of two branches have **diverged**, meaning both branches have new commits since their last common ancestor. This is the reason we created a new commit in both main (9f873cc) & test/conflict-2 (77be3c6) branches.
> 
> - Also conflict only occurs when the two branches have modified the content of same file. This is why we are modifying the same files in this exercise.