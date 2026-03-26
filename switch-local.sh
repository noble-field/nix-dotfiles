TARGET_CONFIG=${1}

home-manager switch --flake .#${TARGET_CONFIG} --impure
