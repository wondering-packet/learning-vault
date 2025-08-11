> [!tip]
> check out the KB [KB013 - Pull](../KBs/KB013%20-%20Pull.md) for theory.

In this exercise I am going to focus on `git pull` vs `git pull --rebase`.

#### **1.  Let's look at a local file**

```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat hello.txt  
hello, this is my new repo for learning IaC  
-WP  
main: adding some features  
main: adding some features v2  
main: adding some features v3  
  
removed conflicting lines from both branches!!  
main: testing pr workflow  
main: testing pr workflow v2  
main: testing pr workflow xv1  
main: testing pr workflow xv2  
main: testing pr workflow yv1  
main: testing pr workflow yv2  
main: testing pr workflow zv1  
main: testing pr workflow zv2  
main: testing pr4 v1  
main: testing pr4 v2  
main: change after pr-5 v1  
main: someone else makes a change  
origin/main: someone else makes a change v1  
origin/main: someone else makes a change v2  
```

#### 2. **Goto github - make a change to the same file**

1. Visit your github repo; mine is: https://github.com/wondering-packet/iac-git.
2. Make a change to hello.txt file.
	1. added this line: `origin/main: someone else makes a change v4`
3. Commit in github.

#### **3. Let's pull latest changes (best practice)**

```bash
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git pull  
Updating 2f370d2..52f59f3  
Fast-forward  
hello.txt | 1 +  
1 file changed, 1 insertion(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$  
# 
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ cat hello.txt  
hello, this is my new repo for learning IaC  
-WP  
main: adding some features  
main: adding some features v2  
main: adding some features v3  
  
removed conflicting lines from both branches!!  
main: testing pr workflow  
main: testing pr workflow v2  
main: testing pr workflow xv1  
main: testing pr workflow xv2  
main: testing pr workflow yv1  
main: testing pr workflow yv2  
main: testing pr workflow zv1  
main: testing pr workflow zv2  
main: testing pr4 v1  
main: testing pr4 v2  
main: change after pr-5 v1  
main: someone else makes a change  
origin/main: someone else makes a change v1  
origin/main: someone else makes a change v2  
origin/main: someone else makes a change v3  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ echo "main: local change v1" >> hello.txt  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git commit -am "main: local change v1"  
[main dc9f319] main: local change v1  
1 file changed, 1 insertion(+)  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git pull  
remote: Enumerating objects: 3, done.  
remote: Counting objects: 100% (3/3), done.  
remote: Compressing objects: 100% (3/3), done.  
remote: Total 3 (delta 0), reused 0 (delta 0), pack-reused 0 (from 0)  
Unpacking objects: 100% (3/3), 1.47 KiB | 502.00 KiB/s, done.  
From https://github.com/wondering-packet/iac-git  
52f59f3..b59a4f1  main       -> origin/main  
hint: You have divergent branches and need to specify how to reconcile them.  
hint: You can do so by running one of the following commands sometime before  
hint: your next pull:  
hint:  
hint:   git config pull.rebase false  # merge  
hint:   git config pull.rebase true   # rebase  
hint:   git config pull.ff only       # fast-forward only  
hint:  
hint: You can replace "git config" with "git config --global" to set a default  
hint: preference for all repositories. You can also pass --rebase, --no-rebase,  
hint: or --ff-only on the command line to override the configured default per  
hint: invocation.  
fatal: Need to specify how to reconcile divergent branches.  
akashi@Seijuro-PC:.../Git/local-repos/iac-git$ git log --oneline --graph --all  
* dc9f319 (HEAD -> main) main: local change v1  
| * b59a4f1 (origin/main) origin/main: remote change v4  
|/  
* 52f59f3 origin/main: remote change v3  
* 2f370d2 origin/main: remote change v1
```

