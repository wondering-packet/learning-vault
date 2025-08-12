In this exercise let's add a script that block a commit if a file change contains "WIP" keyword.

#### **1. Add a hook**

```bash
mkdir -p .git/hooks
cat > .git/hooks/pre-commit << 'EOF'
#!/usr/bin/env bash
if git diff --cached | grep -qi "WIP"; then
  echo "❌ Commit blocked: staged changes contain 'WIP'"
  exit 1
fi
exit 0
EOF
chmod +x .git/hooks/pre-commit
```

#### **2. Test**

```bash
echo "WIP: do not ship" >> notes.txt     # contains WIP keyword!
git add notes.txt
git commit -m "test: commit with WIP"    # should FAIL
# output
❌ Commit blocked: staged changes contain 'WIP'
# confirm file content
cat notes.txt  
WIP: do not ship
```

#### **3. Fix & Test again**

```bash
# rewriting the file
echo "do not ship" > notes.txt  
# no WIP keyword now
cat notes.txt  
do not ship  
git add notes.txt  
# successfull commit
git commit -m "test: WIP change" 
[test/undo-4 51c08f9] test: WIP change  
1 file changed, 1 insertion(+)  
create mode 100644 notes.txt
```