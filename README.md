# nix-darwin-devbox

This sets up an opinionated collection of dev dependencies on Mac arm64
(M1/M2/...).

## Pre-requisites

Homebrew must be previously installed.

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
```

**DANGER:** If you change the `onActivation` property in
[homebrew.nix](homebrew.nix) to a value different from `none`, it can nuke your
other Homebrew packages. Be careful.

Read the options before changing the [homebrew.nix](homebrew.nix) configuration:

<https://daiderd.com/nix-darwin/manual/index.html#opt-homebrew.onActivation.upgrade>

## Bootstrap

1. Install the
   [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix > nix-installer.sh
chmod +x nix-installer.sh
./nix-installer.sh install
```

or if you prefer the YOLO command:

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
```

2. Enable experimental features for flakes by default

```sh
mkdir -p ~/.config/nix
cat << CONF >  ~/.config/nix/nix.conf
experimental-features = nix-command flakes
CONF
```

3. Clone this repo (if you prefer, fork it first and use your own version)

```sh
mkdir -p ~/.config
# actually ~/.config/nix-darwin is arbitrary, it can be any directory (adjust all commands if changing it)
git clone https://github.com/andreswebs/nix-darwin-devbox.git ~/.config/nix-darwin
```

Alternatively, if you're bootstrapping a new system without `git` installed,
run:

```sh
nix shell nixpkgs#git --command nix flake clone github:andreswebs/nix-darwin-devbox --dest ~/.config/nix-darwin
```

4. Bootstrap the flake with your hostname:

```sh
sed -i '' "s/devbox/$(scutil --get LocalHostName)/g" ~/.config/nix-darwin/flake.nix
nix run nix-darwin -- switch --flake ~/.config/nix-darwin
```

## Update

After updating any of the configs, run to apply:

```sh
darwin-rebuild switch --flake ~/.config/nix-darwin
```

## References

<https://zero-to-nix.com/>

<https://jvns.ca/blog/2023/11/11/notes-on-nix-flakes/>

<https://github.com/LnL7/nix-darwin>

<https://github.com/ryan4yin/nix-darwin-kickstarter>

<https://daiderd.com/nix-darwin/manual/index.html>
