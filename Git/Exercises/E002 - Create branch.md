#### **1. Create a new branch**
```bash
# list all branches; * indicates where you currently are.
git branch
* main  
# creating a new branch feature/login.
git branch feature/login  
# validate; notice we are still on "main".
git branch  
feature/login  
* main  
# switching to a branch.
git checkout feature/login  
Switched to branch 'feature/login'  # validation message.
git branch  
* feature/login  # * confirms we are not on feature/login branch.
main
# here is you can combine creating + switcing in one command.
git checkout -b feature/logout  
Switched to a new branch 'feature/logout'  
git branch  
feature/login  
* feature/logout  
main
```
#### **2. Commit & Push**
1. Commit:
```bash
# deleting a test file.
rm readme.md
# creating a test file in the feature/logout branch.
echo "logout: this is logout file" > logout.txt  
# staging & commiting.
git add .  
git commit -m "logout: added v1"  
[feature/logout ee1a39f] logout: added v1  
2 files changed, 1 insertion(+), 1 deletion(-)  
create mode 100644 logout.txt  
delete mode 100644 readme.md
# pushing while specifying the remote branch. IMPORTANT if upstream is not set already!
git push origin feature/logout 
# you will see a normal push output with no errors.
```

2. Push & "origin -u" explained:

```bash
# editing a file so we can make a new commit.
nano logout.txt    # edited the file.
# staging.
git add .
git commit -m "logout: v2"
[feature/logout 2f11877] logout: v2
1 file changed, 1 insertion(+), 1 deletion(-)
# notice git push failed because we did not specify the remote branch like we did earlier.
git push
fatal: The current branch feature/logout has no upstream branch.
To push the current branch and set the remote as upstream, use

git push --set-upstream origin feature/logout

To have this happen automatically for branches without a tracking
upstream, see 'push.autoSetupRemote' in 'git help config'.

# let's try again, this time specifying the remote branch,
# also note that "-u" tells the git to now start tracking
# our local feature/logout with the remote origin/feature/logout
# we only have to do this once, all future commits will now
# point to the correct remote brach for this local branch.

git push origin -u feature/logout
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 304 bytes | 304.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/wondering-packet/iac-git.git
ee1a39f..2f11877  feature/logout -> feature/logout
branch 'feature/logout' set up to track 'origin/feature/logout'.

# another commit to test out that tracking was setup correctly.
nano logout.txt
# staging, commiting & pushing.
git add .
git commit -m "logout: v3"
[feature/logout 821ce60] logout: v3
1 file changed, 1 insertion(+), 1 deletion(-)
# notice, we no longer need to specify the remote branch now; git is tracking this local with its remote already.
git push
Enumerating objects: 5, done.
Counting objects: 100% (5/5), done.
Delta compression using up to 4 threads
Compressing objects: 100% (2/2), done.
Writing objects: 100% (3/3), 305 bytes | 305.00 KiB/s, done.
Total 3 (delta 0), reused 0 (delta 0), pack-reused 0
To https://github.com/wondering-packet/iac-git.git
2f11877..821ce60  feature/logout -> feature/logout
```