# Goal: Let's create a new repository & connect it to a remote branch

## 1. Create a local directory & Initialize

```bash
cd /path/to/your/working/directory
mkdir iac-git
cd iac-git
# initialize git inside this directory.
git init
# set the default branch name. we are using main which is common.
git branch -m main
# let's make a test file which will be included in our first commit.
echo "hello, i am learning Git!" >> hello.txt
ls
	hello.txt
# let's stage the change. "." means all files in the directory.
git add .
# add a commit message.
git commit -m "Initial commit using git"
``` 

## 2. Create remote repository in GitHub

#### a. Create a new repo by going to GitHub page, name it same as your local repo "iac-git".

**Note**: *DO NOT* initialize it with a README, license, or `.gitignore` file. You want an _empty_ repository so your local history can be pushed cleanly without merge conflicts initially.
#### b. Copy the HTTPS url `'https://github.com/your-username/your-repo-name.git`.


