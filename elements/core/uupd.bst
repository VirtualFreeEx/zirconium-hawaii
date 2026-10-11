kind: manual

# uupd provides a vendors folder in their repo so I don't need to pull a thousand go modules manually! :D
sources:
- kind: git_repo
  url: github:ublue-os/uupd.git
  track: v*
  ref: v1.5.0-0-ge5449438a4a50eb4988af88606ba131d78e2db81

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-make.bst
- freedesktop-sdk.bst:components/go.bst

depends:
- freedesktop-sdk.bst:public-stacks/runtime-minimal.bst

config:
  build-commands:
  - |
    go build -v -o output/uupd
  install-commands:
  - |
    install -Dm0644 uupd.service -t "%{install-root}%{indep-libdir}/systemd/system"
    install -Dm0644 uupd-manual.service -t "%{install-root}%{indep-libdir}/systemd/system"
    install -Dm0644 uupd.timer -t "%{install-root}%{indep-libdir}/systemd/system"
    install -Dm0644 uupd.rules -t "%{install-root}%{sysconfdir}/polkit-1/rules.d"
    install -Dm0644 config.json -t "%{install-root}%{sysconfdir}/uupd"

    install -Dm0755 ./output/uupd -t "%{install-root}%{bindir}"
  - |
    %{install-extra}

