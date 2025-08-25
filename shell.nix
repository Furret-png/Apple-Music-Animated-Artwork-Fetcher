{ pkgs ? import <nixpkgs> {} }:

let
  pyenvRoot = "${builtins.getEnv "HOME"}/.pyenv";
  pythonVersion = "3.9";
in pkgs.mkShell {
  name = "animated-album-cover-fetcher-nix-env";

  buildInputs = with pkgs; [
    pyenv
    poetry
    stdenv
    gcc
    pkg-config
    zlib
    bzip2
    xz
    libffi
    openssl
    readline
    sqlite
    tk
    gdbm
    ncurses
    gnumake
    patch
    which
    curl
  ];

  shellHook = ''
    export PYTHON_CONFIGURE_OPTS="--disable-shared"
    export CPPFLAGS="-I${pkgs.zlib.dev}/include -I${pkgs.bzip2.dev}/include -I${pkgs.xz.dev}/include -I${pkgs.openssl.dev}/include -I${pkgs.libffi.dev}/include"
    export CFLAGS="$CPPFLAGS"
    export LDFLAGS="-L${pkgs.zlib.out}/lib -L${pkgs.bzip2.out}/lib -L${pkgs.xz.out}/lib -L${pkgs.openssl.out}/lib -L${pkgs.libffi.out}/lib"
    export PKG_CONFIG_PATH="${pkgs.zlib.dev}/lib/pkgconfig:${pkgs.openssl.dev}/lib/pkgconfig:${pkgs.libffi.dev}/lib/pkgconfig"

    export PATH="$HOME/.pyenv/shims:$HOME/.pyenv/versions/${pythonVersion}/bin:$PATH"

    if [ ! -f .python-version ]; then
      pyenv local 3.9
    fi

    if command -v pyenv >/dev/null 2>&1; then
      eval "$(pyenv init -)"
    fi

    if ! pyenv versions --bare | grep 3.9; then
      echo "Python 3.9 not installed. Installing..."
      pyenv install 3.9
    fi

    if [ ! -f .python-version ]; then
      pyenv local 3.9
    fi

    if [ ! -f pyproject.toml ]; then
      echo "Creating pyproject.toml..."
      poetry init --no-interaction \
        --name my-project \
        --python ">=3.9, <3.10" \
        --dependency requests \
        --dependency m3u8 \
        --dependency mutagen \
        --dependency colorama \
        --dependency prettytable \
        --dependency sanitize-filename
    fi

    if [ ! -d .venv ]; then
      echo "Creating virtual environment and installing dependencies..."
      poetry config virtualenvs.in-project true
      poetry install --no-root
    fi

    eval $(poetry env activate)

    echo "Poetry environment ready. Virtualenv: $VIRTUAL_ENV"
  '';
}
