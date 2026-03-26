TARGET_CONFIG=${1}

home-manager switch --flake github:noble-field/nix-dotfiles#${TARGET_CONFIG} --override-input repo-root github:noble-field/nix-dotfiles --impure --refresh --no-write-lock-file
