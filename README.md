# Installation

### 1. Install Nix 
```sh
`sh <(curl -L https://nixos.org/nix/install) --daemon`
```

### 2. Install Nix Home Manager

```sh
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install
```

### 3. Enable Nix Flake
```sh
mkdir -p ~/.config/nix && \
echo "experimental-features = nix-command flakes" > ~/.config/nix/nix.conf    
```

### 4. Fetch `flake.nix` and Construct environment
```sh
home-manager switch --flake github:noble-field/nix-dotfiles#ubuntu-server --impure
```

In this example, you can set up the environment using the "ubuntu-server" configuration.

When building locally, follow this command:

```sh
home-manager switch --flake /path/to/nix-dotfiles#ubuntu-server --override-input remote-repo /path/to/nix-dotfiles --impure
```
