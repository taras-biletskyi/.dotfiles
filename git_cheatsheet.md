1. Get all files that have been modified in git branch

```bash
git diff --name-only <notMainDev> $(git merge-base <notMainDev> <mainDev>)
```

2. Get true line blame

```bash
git blame -w -C -C -C -L <1,100> <path_to_file>
```
