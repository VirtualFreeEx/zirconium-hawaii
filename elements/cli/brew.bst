kind: import

sources:
- kind: docker
  url: ghcr:ublue-os/brew
  track: latest
  ref: 31b49a6794384190add2ae54ef6bd918cc207a2a3a8e0817ac2d5bf0f0e9e709

config:
  source: /system_files
  target: /
