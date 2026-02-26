# Homebrew Tap for PgArachne

This repository is a Homebrew tap for PgArachne.

## Install

### CLI (macOS + Linux)
```bash
brew install heptau/tap/pgarachne
```

### GUI app (macOS)
```bash
brew install --cask heptau/tap/pgarachne
```

## Repository structure

- `Formula/pgarachne.rb` - CLI formula
- `Casks/pgarachne.rb` - macOS GUI cask

## Update workflow

1. In the main `pgarachne` repository, run:
```bash
make release
```
2. Copy generated files from:
- `dist/homebrew-tap/Formula/pgarachne.rb`
- `dist/homebrew-tap/Casks/pgarachne.rb`
3. Commit and push updates to this tap repository.
