{
  config,
  pkgs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    rustup
    gcc
    cargo-watch
    pkg-config
    openssl.dev
    devenv # more configuration than nix shells?
    direnv # automatically activate nix shells when entering the dir
  ];

  # These are required because by default rust's compiler looks for these in
  # their usual spot in the FHS. On NixOS, libraries like OpenSSL are not in
  # global paths (e.g., /usr/include, /usr/lib) -- they’re in Nix store paths.
  environment.variables = {
    OPENSSL_DIR = "${pkgs.openssl.dev}";
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  };

  nix.settings.trusted-users = ["root" "robin"];
}
