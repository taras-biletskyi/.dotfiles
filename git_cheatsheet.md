1. Get all files that have been modified in git branch

```bash
git diff --name-only <notMainDev> $(git merge-base <notMainDev> <mainDev>)
```
