#### **1. Let's pick some cherries :)**
(check out the KB [[KB006 - Cherry-picking]] for theory )
```bash
# we are using feature/login-hotfix branch to keep our hotfixes for login branch.
git checkout feature/login-hotfix  
Switched to branch 'feature/login-hotfix'  
Your branch is ahead of 'origin/feature/login-hotfix' by 4 commits.  
(use "git push" to publish your local commits)  
# current hotfixes; ofc this is not how the hotfixes are applied in real world.
# i am just using some texts as hotfixes.
# in real world your hotfixes will have e.g something like a new or edited code block which fixes a bug.
cat login-hotfix  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
# adding a new hotfix.
echo "login-hotfix: hotfix for login branch v7" >> login-hotfix  
# editing our hotfix file using editor. optional.
nano login-hotfix  
# usual staging & commiting. added a few more hotfixes.
# note that we will need to commit our hotfixes before we can cherry-pick them anywhere.
# cherry-picking requires specifying the commit ID.
git add .  
git commit -m "login-hotfix: v7"  
[feature/login-hotfix b78c567] login-hotfix: v7  
1 file changed, 2 insertions(+)  
echo "login-hotfix: hotfix for login branch v8" >> login-hotfix  
git add .  
git commit -m "login-hotfix: v8"  
[feature/login-hotfix 9841b75] login-hotfix: v8  
1 file changed, 1 insertion(+)  
nano login-hotfix  
git add .  
git commit -m "login-hotfix: v9"  
[feature/login-hotfix 97ef01e] login-hotfix: v9  
1 file changed, 3 insertions(+)  
# final hotfix list from the hotfix branch
cat login-hotfix  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
----new----  
login-hotfix: hotfix for login branch v7  
login-hotfix: hotfix for login branch v8  
----superseded----  
login-hotfix: hotfix for login branch v2.3  
login-hotfix: hotfix for login branch v3.1  
# switching to login branch to cherry-pick the commit ID with above hotfixes.
git checkout feature/login  
Switched to branch 'feature/login'  
Your branch is ahead of 'origin/feature/login' by 35 commits.  
(use "git push" to publish your local commits)  
cat login-hotfix  
# current hotfixes.
login: all hotfixes go here!  
  
----previous hotfixes----  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
# finding the commit ID: 97ef01e.
git log --oneline --graph --all  
* 97ef01e (feature/login-hotfix) login-hotfix: v9  
* 9841b75 login-hotfix: v8  
* b78c567 login-hotfix: v7  
| *   c1de310 (HEAD -> feature/login) login: fixed hotfixes :) v2
..truncating output..
* | 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC  
# there is a conflict; we will have to resolve this.
git cherry-pick 97ef01e  
Auto-merging login-hotfix  
CONFLICT (content): Merge conflict in login-hotfix  
error: could not apply 97ef01e... login-hotfix: v9  
hint: After resolving the conflicts, mark them with  
hint: "git add/rm <pathspec>", then run  
hint: "git cherry-pick --continue".  
hint: You can instead skip this commit with "git cherry-pick --skip".  
hint: To abort and get back to the state before "git cherry-pick",  
hint: run "git cherry-pick --abort". 
# let's look at the conflicts.
# HEAD section is empty which means this is a blank conflict.
cat login-hotfix  
login: all hotfixes go here!  
  
----previous hotfixes----  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
<<<<<<< HEAD  
=======  
----new----  
login-hotfix: hotfix for login branch v7  
login-hotfix: hotfix for login branch v8  
----superseded----  
login-hotfix: hotfix for login branch v2.3  
login-hotfix: hotfix for login branch v3.1  
>>>>>>> 97ef01e (login-hotfix: v9)  
# let's resolve conflicts:
nano login-hotfix  
# staging - you need to do this if a conflict occured.
git add .  
# continuing the cherry-picking process.
# in case, you want to abort the process: "git cherry-pick --abort".
# this will make your files go back to the way they were before cherry-picking.
git cherry-pick --continue  
[feature/login c25cb2a] login: added new hotfixes (v9)  
Date: Wed Aug 6 23:01:46 2025 +0530  
1 file changed, 6 insertions(+)  
```

```bash
# final resolved file
cat login-hotfix  
login: all hotfixes go here!  
  
----previous hotfixes----  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
----new----  
login-hotfix: hotfix for login branch v7  
login-hotfix: hotfix for login branch v8  
----superseded----  
login-hotfix: hotfix for login branch v2.3  
login-hotfix: hotfix for login branch v3.1
```