kind: manual

# go modules killed my family so i'm downloading the binary instead like a stupid chud
sources:
- kind: git_repo
  url: github:junegunn/fzf.git
  track: v*
  ref: v0.74.5-0-gc0a193e031f01fb50bf6f7be4381990a3753f7cf
- kind: anitya
  project-id: 15856
  directory: "bin"
  (?):
  - arch == "aarch64":
      url: github_files:junegunn/fzf/releases/download/v{version}/fzf-{version}-linux_arm64.tar.gz
      ref:
        version: 0.74.5
        sha256sum: cf058001da21724a469b714a29cf4aab9cbe860d218a0d6c1b5b661efad7784c
  - arch == "x86_64":
      url: github_files:junegunn/fzf/releases/download/v{version}/fzf-{version}-linux_amd64.tar.gz
      ref:
        version: 0.74.5
        sha256sum: d47d7f882972c7d674dbbba998ffa4116e68379616ffac7695d0671e9a722c5f
build-depends:
- freedesktop-sdk.bst:public-stacks/runtime-gnu.bst

variables:
  strip-binaries: ""

config:
  install-commands:
  - |
    # Shell stuff
    install -Dm0644 ./shell/*.{ba,z}sh -t "%{install-root}%{datadir}/fzf"
    install -Dm0644 ./bin/fzf-preview.sh -t "%{install-root}%{datadir}/fzf"
    install -Dm0644 ./shell/key-bindings.fish "%{install-root}%{datadir}/fish/vendor_functions.d/fzf_key_bindings.fish"

    # Vim plugin
    install -Dm0644 ./doc/fzf.txt -t "%{install-root}%{datadir}/vim/vimfiles/doc"
    install -Dm0644 ./plugin/fzf.vim -t "%{install-root}%{datadir}/vim/vimfiles/plugin"

    # Manpages
    install -Dm0644 ./man/man1/*.1 -t "%{install-root}%{datadir}/man/man1"

    # fzf
    install -Dm0755 ./bin/fzf{,-tmux} -t "%{install-root}%{bindir}"
  - |
    %{install-extra}

