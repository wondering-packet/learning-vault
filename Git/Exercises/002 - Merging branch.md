#### 1. Merging fast-forward. [[KB-003 (Merge fast-forward)]]
```bash
logoutgit checkout feature/logout  
Switched to branch 'feature/logout'  
Your branch is up to date with 'origin/feature/logout'.  
logout 
logoutls  
hello.txt  logout.txt
logoutgit checkout main  
Switched to branch 'main'  
Your branch is up to date with 'origin/main'.  
logout 
logoutls  
hello.txt  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$
logoutgit merge feature/logout  
Updating 826dd10..f1e6f88  
Fast-forward  
logout.txt | 1 +  
1 file changed, 1 insertion(+)  
create mode 100644 logout.txt  
logout 
logoutls  
hello.txt  logout.txt
git log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 (origin/main) main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC  
git status  
On branch main  
Your branch is ahead of 'origin/main' by 5 commits.  
(use "git push" to publish your local commits)  
  
nothing to commit, working tree clean  
logoutgit push  
Total 0 (delta 0), reused 0 (delta 0), pack-reused 0  
To https://github.com/wondering-packet/iac-git.git  
826dd10..f1e6f88  main -> main  
logoutgit log --oneline --graph --all  
*   f1e6f88 (HEAD -> main, origin/main, origin/feature/logout, feature/logout) Merge branch 'main' into feature/logout  
|\  
| * 826dd10 main: added signature  
* | 821ce60 logout: v3  
* | 2f11877 logout: v2  
* | ee1a39f logout: added v1  
* | 458eafb main: readme.md  
|/  
* 4097e98 (feature/login) new repo for IaC
```