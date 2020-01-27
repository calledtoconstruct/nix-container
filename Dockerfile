FROM nixos/nix

RUN nix-channel --add https://nixos.org/channels/nixos-19.09 nixpkgs
RUN nix-channel --update

RUN nix-build -A pythonFull '<nixpkgs>'
RUN nix-env -iA nixpkgs.gitAndTools.gitFull
RUN mkdir ~/.config
RUN mkdir ~/.config/nixpkgs
RUN echo "{ allowUnfree=true; }" > ~/.config/nixpkgs/config.nix

COPY ./*.nix ./

RUN nix build
