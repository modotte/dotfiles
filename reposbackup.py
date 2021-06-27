from github import Github
import os
import subprocess
import shutil
import sys

github = Github(sys.argv[1])
username = github.get_user().login

# So you won't need to insert SSH key for every clone.
subprocess.run(["ssh-add"])

os.mkdir("reposbackup")

print("Cloning online repositories..")
for repository in github.get_user().get_repos():
    link = "git@github.com:{}/{}".format(username, repository.name)
    print(link)
    subprocess.run(["git", "clone", link])

    shutil.move(repository.name, "reposbackup")

print("Creating tarball")
shutil._make_tarball("reposbackup", "reposbackup", compress="xz")
print("Done")

