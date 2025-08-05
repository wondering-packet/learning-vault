#### **1. Create a new branch, new files &  committing
```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git checkout -b test/conflict-2  
Switched to a new branch 'test/conflict-2'  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ ls  
beta.md  hello.txt  login.md  logout.md  newlogout  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "conflict-2 v1" >> logout.md 
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "conflict-2 v1" >> login.md
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat logout.md  
conflict: new conflict v2  
conflict-2 v1  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat login.md  
conflict: new conflict v2  
conflict/main in login.md  
conflict-2 v1  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git add .  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -m "conflict-2: v1"  
[test/conflict-2 77be3c6] conflict-2: v1  
2 files changed, 2 insertions(+)
```
#### 2. 