# nix-darwin-devbox

This sets up an opinionated collection of dev dependencies on Mac arm64
(M1/M2/...).

## Bootstrap

1. Install the
   [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)

```sh
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix > nix-installer.sh
chmod +x nix-installer.sh
./nix-installer.sh install
```

2. Enable experimental features for flakes by default

```sh
mkdir -p ~/.config/nix
cat << CONF >  ~/.config/nix/nix.conf
experimental-features = nix-command flakes
CONF
```

3. Clone this repo and bootstrap the flake with your hostname using
   [nix-darwin](https://github.com/LnL7/nix-darwin)

```sh
# if you prefer, fork it first and use your own version
mkdir -p ~/.config
# actually ~/.config/nix-darwin is arbitrary, it can be any directory (adjust all commands if changing it)
git clone https://github.com/andreswebs/nix-darwin-devbox.git ~/.config/nix-darwin
sed -i '' "s/devbox/$(hostname)/g" ~/.config/nix-darwin/flake.nix
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
