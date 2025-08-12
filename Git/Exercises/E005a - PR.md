> [!tip]
> check out the KB [KB011 - PR](../KBs/KB011%20-%20PR.md) for theory.

#### **1. Create a new branch & make some changes**

```bash
# test/pr-7 is our new branch
git switch -c test/pr-7  
Switched to a new branch 'test/pr-7'  
echo "pr-7: change v1" > pr-7  
git add .  
git commit -m "pr-7: change v1"  
[test/pr-7 fab8f58] pr-7: change v1  
1 file changed, 1 insertion(+)  
create mode 100644 pr-7  
echo "pr-7: change v2" >> pr-7  
git commit -am "pr-7: change v2"  # -am stages all files & commits; only works if for files that are already tracke
[test/pr-7 082bd8c] pr-7: change v2  
1 file changed, 1 insertion(+)  
echo "pr-7: change v3" >> pr-7  
git commit -am "pr-7: change v3"  
[test/pr-7 adf358d] pr-7: change v3  
1 file changed, 1 insertion(+)  
# here are all the changes
cat pr-7  
pr-7: change v1  
pr-7: change v2  
pr-7: change v3
```

#### **2. Back to Main - let's make a local change to reflect some local work**

```bash
git switch main  
Switched to branch 'main'  
Your branch is ahead of 'origin/main' by 1 commit.  
(use "git push" to publish your local commits)  
# local work
echo "main: someone else makes a change" >> hello.txt  
# commiting & pushing local work
git commit -am "main: change by someone"  
[main d9f003e] main: change by someone  
1 file changed, 1 insertion(+)  
git push  
Enumerating objects: 8, done.  
Counting objects: 100% (8/8), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (6/6), done.  
Writing objects: 100% (6/6), 598 bytes | 299.00 KiB/s, done.  
Total 6 (delta 4), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (4/4), completed with 2 local objects.  
To https://github.com/wondering-packet/iac-git.git  
058f77b..d9f003e  main -> main  
# let's look at the history as of now:
	# fab8f58, 082bd8c & adf358d are the commits from pr-7 branch.
	# d9f003e is the commit from the local work we just did.
git log --oneline --graph --all  
* d9f003e (origin/main, main) main: change by someone  
| * adf358d (HEAD -> test/pr-7) pr-7: change v3  
| * 082bd8c pr-7: change v2  
| * fab8f58 pr-7: change v1  
|/  
* 5066a0a main: change after pr-5 v1
```

#### **3. Goto Github - let's make remote change to simulate someone else working on the repo**

1. Visit your github repo; mine is: https://github.com/wondering-packet/iac-git.
2. Make a change in the main repo, I am changing my hello.txt file.
	1. added this line: `origin/main: someone else makes a change`
3. Commit in github.

#### **4. Fetch all local & remote changes**

> Read more about fetch in [KB0012 - Fetch](../KBs/KB012%20-%20Fetch.md).

```bash
# fetching latest changes
git fetch  
remote: Enumerating objects: 5, done.  
remote: Counting objects: 100% (5/5), done.  
remote: Compressing objects: 100% (3/3), done.  
remote: Total 3 (delta 2), reused 0 (delta 0), pack-reused 0 (from 0)  
Unpacking objects: 100% (3/3), 966 bytes | 64.00 KiB/s, done.  
From https://github.com/wondering-packet/iac-git  
d9f003e..2684670  main       -> origin/main  
# note that 2684670 commit is from the remote work done in previous step #3.
# another crucial thing to note is:
# look at how the pr-7 branch (3 commits) is currently branched off,
# we are going to rebase this to make the history linear in next step. 
git log --oneline --graph --all  
* 2684670 (origin/main) origin/main: someone makes a change (remote)  
* d9f003e (main) main: change by someone  
| * adf358d (HEAD -> test/pr-7) pr-7: change v3  
| * 082bd8c pr-7: change v2  
| * fab8f58 pr-7: change v1  
|/  
* 5066a0a main: change after pr-5 v1
```

#### **5. Rebase before push**

```bash
# rebasing pr-7 branch (all 3 commits) on top of origin/main.
# note that we need to rebase on origin/main (remote) not main (local) since
# origin/main is the true central branch where everyone is pushing
# their changes. this is also why i simulated both local & remote work earlier.
git rebase origin/main  
Successfully rebased and updated refs/heads/test/pr-7.  
# look at the commit history now - linear & pretty just like you (>ᴗ•)!
# in case, you decide to not rebase here - you can still rebase during the PR 
# approval workflow in github; github gives you an option to "rebase & merge" 
# but ideally you should still rebase locally.
git log --oneline --graph --all  
* 3adbaa9 (HEAD -> test/pr-7) pr-7: change v3  
* e82eb11 pr-7: change v2  
* bc2c672 pr-7: change v1  
* 2684670 (origin/main) origin/main: someone makes a change (remote)  
* d9f003e (main) main: change by someone  
* 5066a0a main: change after pr-5 v1
```

#### **6. Push**

```bash
# usual push & validation
git push origin -u test/pr-7  
Enumerating objects: 10, done.  
Counting objects: 100% (10/10), done.  
Delta compression using up to 4 threads  
Compressing objects: 100% (6/6), done.  
Writing objects: 100% (9/9), 812 bytes | 270.00 KiB/s, done.  
Total 9 (delta 3), reused 0 (delta 0), pack-reused 0  
remote: Resolving deltas: 100% (3/3), completed with 1 local object.  
remote:  
remote: Create a pull request for 'test/pr-7' on GitHub by visiting:  
remote:      https://github.com/wondering-packet/iac-git/pull/new/test/pr-7  
remote:  
To https://github.com/wondering-packet/iac-git.git  
* [new branch]      test/pr-7 -> test/pr-7  
branch 'test/pr-7' set up to track 'origin/test/pr-7'.  
```