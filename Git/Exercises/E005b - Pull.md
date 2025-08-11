> [!tip]
> check out the KB [KB013 - Pull](../KBs/KB013%20-%20Pull.md) for theory.

In this exercise I am going to focus on `git pull` vs `git pull --rebase`.

#### **1.  Let's look at a local file**

```bash
# in this exercise, we will be working with this file "hello.txt".
cat hello.txt  
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

#### **3. Let's fetch latest changes (best practice)**

```bash
# shows 1 file changed, 1 insertion because someone else also worked on the same file.
# it's a simple fast-forward merge because we haven't made any local changes yet.
git pull  
Updating 2f370d2..52f59f3  
Fast-forward  
hello.txt | 1 +  
1 file changed, 1 insertion(+)  
# let's look at latest changes
cat hello.txt  
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
origin/main: someone else makes a change v3  # newline
```

#### **4. Let's make a local change to reflect a real-world scenario (different people working in their local branches)**

```bash
echo "main: local change v1" >> hello.txt  
git commit -am "main: local change v1"  
[main dc9f319] main: local change v1  
1 file changed, 1 insertion(+)  
```

#### **5. Let's fetch latest changes again (again it's best practice to fetch new changes before you push your changes)**

```bash
# pulling before i prapre to push my change.
# git by default tries a merge pull which errors out in this case because
# someone else has made another change to our file while we did our work.
git pull  
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
# notice how a normal merge will now result in a non-linear history
git log --oneline --graph --all  
* dc9f319 (HEAD -> main) main: local change v1  # my change
| * b59a4f1 (origin/main) origin/main: remote change v4  # someone else' change
|/  
* 52f59f3 origin/main: remote change v3  
* 2f370d2 origin/main: remote change v1
```

#### **6. Let's pull with a rebase this time**

```bash
# let's do a pull with rebase. this will replay my changes on top of remote changes.
# notice we have a conflict: this means my changes are causing 
# conflict with someone else's changes. 
git pull --rebase  
Auto-merging hello.txt  
CONFLICT (content): Merge conflict in hello.txt  
error: could not apply dc9f319... main: local change v1  
hint: Resolve all conflicts manually, mark them as resolved with  
hint: "git add/rm <conflicted_files>", then run "git rebase --continue".  
hint: You can instead skip this commit: run "git rebase --skip".  
hint: To abort and get back to the state before "git rebase", run "git rebase --abort".  
Could not apply dc9f319... main: local change v1  
# fixing the conflict
nano hello.txt  
# continuing with rebase.
git add .  
git rebase --continue  
[detached HEAD 204de9f] main: fixed a rebase & merge conlict with remote main  
1 file changed, 1 insertion(+)  
Successfully rebased and updated refs/heads/main.  
# notice how we now have a linear history which is easily readable.
# b59a4f1 is the commit from the remote change.
# 204de9f is the new commit replayed from my commit dc9f319 (for my change).
git log --oneline --graph --all  
* 204de9f (HEAD -> main) main: fixed a rebase & merge conlict with remote main  
* b59a4f1 (origin/main) origin/main: remote change v4
* 52f59f3 origin/main: remote change v3  
* 2f370d2 origin/main: remote change v1
```

