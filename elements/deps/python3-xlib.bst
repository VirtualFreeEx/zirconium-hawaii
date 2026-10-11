kind: manual

sources:
- kind: git_repo
  url: github:python-xlib/python-xlib.git
  track: "*.*"
  exclude:
  - "*rc*"
  ref: 0.33-0-g4e8bbf8fc4941e5da301a8b3db8d27e98de68666
- kind: patch_queue
  path: patches/python3-xlib

build-depends:
- freedesktop-sdk.bst:public-stacks/buildsystem-python-setuptools.bst
- freedesktop-sdk.bst:components/python3-setuptools-scm.bst
- freedesktop-sdk.bst:components/python3-wheel.bst

depends:
- freedesktop-sdk.bst:components/python3.bst
- freedesktop-sdk-extra.bst:components/python3-six.bst

config:
  build-commands:
  - |
    python -m build -nw
  install-commands:
  - |
    python -m installer -d "%{install-root}" dist/*.whl
  - |
    %{install-extra}

