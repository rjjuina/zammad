{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, flake-parts, ... }@inputs: 
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      perSystem = {config, self', inputs', pkgs, system, lib, ...}: {
        devShells.default = pkgs.mkShell {
          nativeBuildInputs = with pkgs; [
            nixfmt-rfc-style
            nixd
            postgresql
            redis
            nodejs
            pnpm_10
            procps
            imlib2
            jq
            moreutils
            cacert
            bundix
            libyaml
            openssl
            openssl.dev
            pkg-config
            mysql80
            zstd
            foreman
            ruby_3_2
          ];

          shellHook = ''
            export RAILS_ENV=development
            export PATH="$PWD/bin:$PATH"
            export PKG_CONFIG_PATH="${pkgs.openssl.dev}/lib/pkgconfig"
          '';
        };
      };
    };
}
