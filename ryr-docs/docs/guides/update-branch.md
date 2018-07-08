# Sync up your fork with upstream

When working with other developers, it can be that the branch your are working on becomes out of sync with the base
branch. In your Github PR your will see the following message:

![out of date](img/branch-out-of-date.png)

If this happens, you need to retrieve all the changes from upstream, and apply them to your branch by rebasing it on top of master.

## Steps to keep your PR update-to-date

Sync up your fork with `upstream`:
```bash
git checkout master
git pull upstream master
git push origin master
```

Rebase your branch:
```bash
git checkout -
git rebase master
```

Update your PR:
```bash
git push origin -f
```
