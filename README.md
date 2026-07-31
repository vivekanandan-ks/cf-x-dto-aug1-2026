**Talk**

# What's Nix and it's ecosystem of approaches in a Bird's eye view

**Date:** Aug 1, 2026

**Organizer:** FOSS United Chennai X From Dev to Opss

**Proposal Link:** https://fossunited.org/c/chennai/august-26/cfp/2v67e90i2r

This presentation is a Terminal User Interface (TUI) and can be run directly inside your terminal using Nix.
Works on NixOS, macOS, Linux and WSL. No need to install anything. Just run :-)

## Run the Presentation

You can view this presentation with a single command without needing to clone the repository or manually install any dependencies. Just run:

```bash
# Directly from Codeberg
nix run

# Or if cloned locally
nix run .
```

### Benefits of Running via Nix
- **No Git Clone Required**: The necessary code and assets are fetched directly in the background.
- **Zero Manual Installs**: You don't need to pollute your system by temporarily installing `presenterm` or other tools. Nix handles all dependencies in perfect isolation.
- **Single Command Magic**: Everything is packaged into one command. You hit enter, and the presentation opens instantly.

## Exporting Presentations

You can easily generate a PDF or a self-contained HTML file of this presentation by running the specific endpoints provided by the flake. This uses isolated dependencies (`presenterm`, `weasyprint`) without polluting your system.

To generate an HTML file (`presentation.html`):
```bash
# Directly from Codeberg
nix run git+https://codeberg.org/vivekanandanks/ksv-artifacts.git?dir=TossConf26/nix-shells-workshop#html

# Or if cloned locally
nix run .#html
```

To generate a PDF document (`presentation.pdf`):
```bash
# Directly from Codeberg
nix run git+https://codeberg.org/vivekanandanks/ksv-artifacts.git?dir=TossConf26/nix-shells-workshop#pdf

# Or if cloned locally
nix run .#pdf
```
