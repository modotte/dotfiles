from github import Github
import os
import subprocess
import shutil
import sys

try:
    github = Github(sys.argv[1])
except IndexError:
    print("need Github personal access token key as first argument", file=sys.stderr)
    sys.exit(1)

username = github.get_user().login
dirname = "reposbackup"

# So you won't need to insert SSH key for every cloning process.
subprocess.run(["ssh-add"])

os.mkdir(dirname)

print("cloning online repositories..")
for repository in github.get_user().get_repos():
    link = "git@github.com:{}/{}".format(username, repository.name)
    print(link)
    subprocess.run(["git", "clone", link])
    shutil.move(repository.name, dirname)

print("creating tarball..")
shutil._make_tarball(dirname, dirname, compress="xz")
print("done")

