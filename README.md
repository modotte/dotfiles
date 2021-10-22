# scripts
My Unix-like systems automation scripts.
It's meant to be used on various Linux distributions and FreeBSD/OpenBSD/NetBSD.
Anyway, I mostly use these scripts for my personal use only, but if you find
some of these scripts been helpful to you, let me know by leaving a star on this repository.


## Usage  
### Emacs scripts
Follow instructions in the README of the subdirectory.

### Shell scripts
Simply run `bash script.sh`

### Python 3+ scripts
Run `python3 script.py`. If it complains about missing module, install it with `pip install module`

## Scripts Overview

- cl_project.sh
  - Creates a Common Lisp project skeleton automatically.
  - Usage: `cl_project.sh -n PROJECT_NAME -l LISP_COMPILER -d TARGET_DIR`
  - For more info, run `cl_project.sh -h`.
  
- reposbackup.py
  - Clone all repositories from user (required personal access token as argument)
  - Usage: `reposbackup.py GITHUB_PERSONAL_ACCESS_TOKEN_KEY`
  - This will create **reposbackup.tar.xz** once it is done.

## License
This project is licensed under the BSD-3-Clause license. See LICENSE file for details.

