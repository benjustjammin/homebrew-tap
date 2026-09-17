# benjustjammin/homebrew-tap

Homebrew casks for my own apps.

```sh
brew tap benjustjammin/tap
brew trust benjustjammin/tap
brew install --cask justhide
```

Homebrew 7 refuses to load a cask from a tap you have not trusted, which is why the
middle line exists — without it you get *"Refusing to load cask … from untrusted
tap"*. `brew trust --cask benjustjammin/tap/justhide` trusts just the one cask
instead of everything here.

Then upgrades come along with everything else:

```sh
brew upgrade --cask justhide
```

## Casks

| Cask | What it is |
| --- | --- |
| [`justhide`](Casks/justhide.rb) | [JustHide](https://github.com/benjustjammin/justhide) — a small menu bar tidier for macOS 27 |

The cask's `version` and `sha256` are bumped automatically by JustHide's
release workflow; see `docs/RELEASING.md` in that repo.
