#### 1. Check current commit history
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 1 commit.  
(use "git push" to publish your local commits)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 5cfa15d (feature/logout) logout: new feature v1  
| * 1b364ef (feature/login) login: new feature v3  
| * 0de1146 login: new feature v2  
| * 1da19b5 login: new feature v1  
|/  
* 4421ab9 (HEAD -> main) main: v2  
*   c3be76d (origin/main) Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login) login: v1  
* |   f1e6f88 (origin/feature/logout) Merge branch 'main' into feature/logout  
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
#### 2. Create a new branch & make some commits
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout -b feature/rebase  
Switched to a new branch 'feature/rebase'  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
hello.txt  login.md  logout.txt  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "rebase: v1" > rebase  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "rebase: v1"  
[feature/rebase d70242d] rebase: v1  
1 file changed, 1 insertion(+)  
create mode 100644 rebase  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "rebase: v2" >> rebase  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "rebase: v2"  
[feature/rebase a751c39] rebase: v2  
1 file changed, 1 insertion(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "rebase: v3" >> rebase  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "rebase: v3"  
[feature/rebase 4f88169] rebase: v3  
1 file changed, 1 insertion(+)
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 4f88169 (HEAD -> feature/rebase) rebase: v3  
* a751c39 rebase: v2  
* d70242d rebase: v1  
| * 5cfa15d (feature/logout) logout: new feature v1  
|/  
| * 1b364ef (feature/login) login: new feature v3  
| * 0de1146 login: new feature v2  
| * 1da19b5 login: new feature v1  
|/  
* 4421ab9 (main) main: v2  
*   c3be76d (origin/main) Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login) login: v1  
* |   f1e6f88 (origin/feature/logout) Merge branch 'main' into feature/logout  
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

> [!important]
> DO NOT push the new commits for the branch you are going to rebase.
> - **The Golden Rule of Rebase:** **Never rebase commits that you have already pushed to a public/shared remote repository and that other people might have pulled down.**
> - **Why?** Rebasing re-writes history by creating _new_ commits. If you push `feature/rebase` (containing commits A, B, C) and then rebase it locally (which creates new commits A', B', C'), your local branch now has a completely different history than the remote branch. When you then try to push again, Git will be confused, as the histories have diverged. You'd be forced to `git push --force`, which is dangerous because it overwrites the remote history and can cause major problems for anyone who has already pulled your original (A, B, C) commits.
#### 3. Switch back to Main & make a new commit so the current tip of Main changes (explained below)
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git pull origin main   
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout main
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 1 commit.  
(use "git push" to publish your local commits) 
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "main: adding some features v2" >> hello.txt  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "main: new features v2"  
[main 6a01500] main: new features v2  
1 file changed, 1 insertion(+)
```
Always pull your main before trying to rebase. 
#### 4. Rebase
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 6a01500 (HEAD -> main, origin/main) main: new features v2  
| * 4f88169 (origin/feature/rebase, feature/rebase) rebase: v3  
| * a751c39 rebase: v2  
| * d70242d rebase: v1  
|/  
| * 5cfa15d (feature/logout) logout: new feature v1  
|/  
| * 1b364ef (feature/login) login: new feature v3  
| * 0de1146 login: new feature v2  
| * 1da19b5 login: new feature v1  
|/  
* 4421ab9 main: v2  
*   c3be76d Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login) login: v1  
* |   f1e6f88 (origin/feature/logout) Merge branch 'main' into feature/logout  
|\ \  
| * | 826dd10 main: added signature  
| |/  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout feature/rebase  
Switched to branch 'feature/rebase'  
Your branch is up to date with 'origin/feature/rebase'.  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git rebase main  
Successfully rebased and updated refs/heads/feature/rebase.  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* 10659aa (HEAD -> feature/rebase) rebase: v3  
* 72be6f5 rebase: v2  
* 040432a rebase: v1  
* 6a01500 (origin/main, main) main: new features v2  
| * 4f88169 (origin/feature/rebase) rebase: v3  
| * a751c39 rebase: v2  
| * d70242d rebase: v1  
|/  
| * 5cfa15d (feature/logout) logout: new feature v1  
|/  
| * 1b364ef (feature/login) login: new feature v3  
| * 0de1146 login: new feature v2  
| * 1da19b5 login: new feature v1  
|/  
* 4421ab9 main: v2  
*   c3be76d Merge branch 'feature/login'  
|\  
| * 3c86970 (origin/feature/login) login: v1  
* |   f1e6f88 (origin/feature/logout) Merge branch 'main' into feature/logout  
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