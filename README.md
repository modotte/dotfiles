# scripts
My Unix-like systems automation scripts.
It's meant to be used on various Linux distributions and FreeBSD/OpenBSD/NetBSD.
Anyway, I mostly use these scripts for my personal use only, but if you find
some of these scripts been helpful to you, please consider to *star* this repository.


## Usage
### Common lisp scripts (.ros)
To run scripts with `.ros` extension, please install [Roswell](https://roswell.github.io/Installation.html).
The Common Lisp scripts (ended with `.ros` extension) could be invoked with:
- `ros exec script.ros`
- For faster startup time, you can build the script into (using sbcl) fast execution speed, native machine executable:
  - `ros build script.ros` and to run `./script`
  
### Emacs scripts
Follow instructions in the README of the subdirectory.

### Shell scripts
Simply run `bash script.sh`

### Python 3+ scripts
Run `python3 script.py`. If it complains about missing module, install it with `pip install module`

## Scripts Overview

- cl-project.ros
  - Creates a Common Lisp project skeleton automatically.
  - Usage: `cl-project.ros PROJECT_NAME [LOCAL_PROJECTS_ROOT_DIRECTORY]`
  - Example: `cl-project.ros meow # By default, creates $HOME/.roswell/local-projects/meow`
  
- reposbackup.py
  - Clone all repositories from user (required personal access token as argument)
  - Usage: `reposbackup.py GITHUB_PERSONAL_ACCESS_TOKEN_KEY`
  - This will create **reposbackup.tar.xz** once it is done.

## License
This project is licensed under the BSD-3-Clause license. See LICENSE file for details.

