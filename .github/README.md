[![](https://shields.kaki87.net/badge/github.com-master-blue?style=flat&logo=github)](https://github.com/VibedByKaKi-cosmic/cosmic-applets)
[![](https://shields.kaki87.net/github/stars/VibedByKaKi-cosmic/cosmic-applets)](https://github.com/VibedByKaKi-cosmic/cosmic-applets)

# COSMIC Applets, AI-augmented

Original `README.md` :
- [upstream on `master` branch](https://github.com/pop-os/cosmic-applets/blob/master/README.md).

## Exclusive features

### APT repository

For Debian/Ubuntu-based distros, add `cosmic-applets` to APT for automated updates :

```bash
echo "deb [trusted=yes] https://raw.githubusercontent.com/VibedByKaKi-cosmic/cosmic-applets/refs/heads/apt stable main" | sudo tee /etc/apt/sources.list.d/cosmic-applets.list
sudo apt update
sudo apt install cosmic-applets
```

### GitHub Releases

From the [latest release](https://github.com/VibedByKaKi-cosmic/cosmic-applets/releases/latest), download :

| Architecture \ Package type | DEB package                   |
| --------------------------- | ----------------------------- |
| **`amd64`/`x86-64`**        | `cosmic-applets_*_amd64.deb`  |

## Fixes

_Placeholder. List the fixes this fork carries on top of upstream here._
