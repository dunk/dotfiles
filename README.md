# Installation

## Installing via git

Clone the repo, and then run the `init` script. This script is destructive, and will replace files in the homedir with symlinks to this dir. This is done so that rolling changes back upstream is easy, preventing drift / entropy between different installations.

```bash
git clone https://github.com/dunk/dotfiles.git && cd dotfiles && ./init.sh
```

## Installing without git

To install these dotfiles without git:

```bash
curl -#L https://github.com/dunk/dotfiles/tarball/master | tar -xzv --strip-components 1 --exclude={README.md,LICENSE-MIT.txt,init.sh}
```
