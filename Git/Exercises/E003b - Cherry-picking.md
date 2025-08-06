#### **1. Let's pick some cherries :)**
(check out the KB [[KB006 - Cherry-picking]] for theory )
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout feature/login-hotfix  
Switched to branch 'feature/login-hotfix'  
Your branch is ahead of 'origin/feature/login-hotfix' by 4 commits.  
(use "git push" to publish your local commits)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login-hotfix  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "login-hotfix: hotfix for login branch v7" >> login-hotfix  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ nano login-hotfix  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "login-hotfix: v7"  
[feature/login-hotfix b78c567] login-hotfix: v7  
1 file changed, 2 insertions(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "login-hotfix: hotfix for login branch v8" >> login-hotfix  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "login-hotfix: v8"  
[feature/login-hotfix 9841b75] login-hotfix: v8  
1 file changed, 1 insertion(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ nano login-hotfix  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "login-hotfix: v9"  
[feature/login-hotfix 97ef01e] login-hotfix: v9  
1 file changed, 3 insertions(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login-hotfix  
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
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout feature/login  
Switched to branch 'feature/login'  
Your branch is ahead of 'origin/feature/login' by 35 commits.  
(use "git push" to publish your local commits)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login-hotfix  
login: all hotfixes go here!  
  
----previous hotfixes----  
login-hotfix: hotfix for login branch  
login-hotfix: hotfix for login branch v2  
login-hotfix: hotfix for login branch v2.2  
login-hotfix: hotfix for login branch v3  
login-hotfix: hotfix for login branch v4.1  
login-hotfix: hotfix for login branch v5.2  
login-hotfix: hotfix for login branch v6  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 97ef01e (feature/login-hotfix) login-hotfix: v9  
* 9841b75 login-hotfix: v8  
* b78c567 login-hotfix: v7  
| *   c1de310 (HEAD -> feature/login) login: fixed hotfixes :) v2
* | 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git cherry-pick 97ef01e  
Auto-merging login-hotfix  
CONFLICT (content): Merge conflict in login-hotfix  
error: could not apply 97ef01e... login-hotfix: v9  
hint: After resolving the conflicts, mark them with  
hint: "git add/rm <pathspec>", then run  
hint: "git cherry-pick --continue".  
hint: You can instead skip this commit with "git cherry-pick --skip".  
hint: To abort and get back to the state before "git cherry-pick",  
hint: run "git cherry-pick --abort".  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login-hotfix  
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
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ nano login-hotfix  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ nano login-hotfix  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git cherry-pick --continue  
[feature/login c25cb2a] login: added new hotfixes (v9)  
Date: Wed Aug 6 23:01:46 2025 +0530  
1 file changed, 6 insertions(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login-hotfix  
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