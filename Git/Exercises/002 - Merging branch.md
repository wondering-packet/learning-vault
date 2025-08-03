#### 1. Merging fast-forward. [[KB-003 (Merge fast-forward)]]
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout feature/logout  
Switched to branch 'feature/logout'  
Your branch is up to date with 'origin/feature/logout'.  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
hello.txt  logout.txt
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
hello.txt  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git merge feature/logout  
Updating 826dd10..f1e6f88  
Fast-forward  
logout.txt | 1 +  
1 file changed, 1 insertion(+)  
create mode 100644 logout.txt  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
hello.txt  logout.txt
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 (origin/main) main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$
```