# ToonSuite

Downloads for the ToonSuite apps: tools for multi-tooners on Toontown Rewritten and Corporate Clash.

| App | What it does | Platforms |
|---|---|---|
| **Tunetoon** | A launcher for all your toons. Save your accounts, and start any set of toons simultaneously. | Windows, macOS and Linux |
| **Multicontroller** | Control multiple toons simultaneously. | Windows |

## Download

Everything lives on the [**Releases**](../../releases) page. The whole suite ships as **one release per version**,
tagged `vX.Y.Z` (e.g. `v1.0.0`), open the [**latest release**](../../releases/latest) and grab the file for your
app and system:

| App | Windows | macOS | Linux |
|---|---|---|---|
| Tunetoon | `Tunetoon.exe` | `Tunetoon-macos-arm64.zip` (Apple Silicon) · `Tunetoon-macos-x64.zip` (Intel) | `Tunetoon-Linux.AppImage` |
| Multicontroller | `Multicontroller.exe` | — | — |

There is no installer. Each download is a single self-contained program. Put it in a folder and run it.

## Install and first run

### Windows

1. Download the `.exe` and drop it in a folder of your choice.
   - Keep **Multicontroller.exe** in its own folder. It saves its settings in a file next to the exe.
   - **Tunetoon** stores its data under `%LocalAppData%\Tunetoon`, so you can move or overwrite the exe freely without losing your accounts.
2. On the first run of a new version, Windows SmartScreen may show a blue "Windows protected your PC" box because the app is not code signed. Click **More info**, then **Run anyway**. You only see this once per version.

### macOS (Tunetoon)

Tunetoon ships two macOS builds: `Tunetoon-macos-arm64.zip` (Apple Silicon) and `Tunetoon-macos-x64.zip` (Intel). To install:

1. Download the zip for your Mac and unzip it.
2. Drag `Tunetoon.app` anywhere you like.
3. On first launch, right-click (or Control-click) the app and choose **Open**, then **Open** again. macOS shows a warning because the app is not notarized with Apple. This happens only the first time.

### Linux (Tunetoon)

#### AppImage

1. Download `Tunetoon-x86_64.AppImage` from the [latest release](../../releases/latest).
2. Make it executable and run it:
   ```bash
   chmod +x Tunetoon-x86_64.AppImage
   ./Tunetoon-x86_64.AppImage
   ```

Some distros require `libfuse2` for AppImages to run:
```bash
# Ubuntu / Mint
sudo apt install libfuse2
```

#### NixOS (declarative install)

Add Tunetoon to your system or home-manager config:

```nix
# flake.nix inputs
inputs.tunetoon.url = "github:the-finest-noobs/ToonSuite-releases";

# NixOS — environment.systemPackages
environment.systemPackages = [ inputs.tunetoon.packages.x86_64-linux.default ];

# or home-manager — home.packages
home.packages = [ inputs.tunetoon.packages.x86_64-linux.default ];
```

Or run without installing:
```bash
nix run github:the-finest-noobs/ToonSuite-releases
```

## Staying up to date

You only need to download from here once. Both apps check for a newer release when they start, and you can also check any time from **About > Check for updates**. Updates download and install in place, then relaunch the app. On macOS the in-app update does not retrigger the first-launch warning.

## Verifying a download

Every release ships a single `SHA256SUMS.txt` covering all of that version's downloads, so you can confirm yours is intact.

On Windows PowerShell:

```powershell
Get-FileHash .\Tunetoon.exe -Algorithm SHA256
```

Compare the printed hash against the matching line in the checksum file.
