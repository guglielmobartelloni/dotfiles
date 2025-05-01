This repo uses `GNU/Stow` to manage symlinks for the dotfiles.

# Installation

this repo needs to be cloned into `~/` the home dir to work properly then:

```bash
stow .
```

that's it! All the files will be symlinked to the proper location

For the encrypted folders with ansible do the command:

```bash
ansible-playbook --vault-password ~/.vault-pass.txt decrypt_link.yml
```

obviuosly with the password file in the correct location
