# nvm_auto
Automatically switches the current version of node when you cd between your different projects by running `nvm use` when entering a directory with an `.nvmrc`.

Adapted from [chruby](https://github.com/postmodern/chruby)'s chruby_auto.sh script.

## Installing

Installing nvm_auto simply involves putting the script somewhere on your local machine and then sourcing it into your shell.

For example:

```sh
mkdir -p ~/.nvm_auto
curl -o ~/.nvm_auto/nvm_auto.sh https://raw.githubusercontent.com/jsdf/nvm_auto/master/nvm_auto.sh 
```

Then add the following line to your `~/.bashrc` or `~/.zshrc`:

```sh
source ~/.nvm_auto/nvm_auto.sh
```

Open a new shell window and it should be ready to go.

### Additional Configuration

By default, nvm_auto switches back to the default node version when exiting a project (a directory tree with an `.nvmrc` somewhere in the hierarchy). If you don't want this behaviour, set the `NVM_AUTO_NO_RESET` environment variable in your shell's rc file, eg.

```sh
source ~/.nvm_auto/nvm_auto.sh
NVM_AUTO_NO_RESET=y
```

