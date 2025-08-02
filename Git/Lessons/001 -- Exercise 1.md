# Let's create a  new repo!

# 1. Create a local directory & Initialize

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

# 2. Create remote repo in Github

