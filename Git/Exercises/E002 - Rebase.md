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
