# ToonSuite

Downloads for the ToonSuite apps: tools for multi-tooners on Toontown Rewritten and Corporate Clash.

| App | What it does | Platforms |
|---|---|---|
| **Tunetoon** | A launcher for all your toons. Save your accounts, and start any set of toons simultaneously. | Windows, macOS (beta), Linux |
| **Multicontroller** | Control multiple toons simultaneously. | Windows, macOS (beta), Linux (beta) |

## Download

Everything lives on the [**Releases**](../../releases) page. The whole suite ships as **one release per version**,
tagged `vX.Y.Z` (e.g. `v1.1.0`). Open the [**latest release**](../../releases/latest) and grab the file for your
app and system:

| App | Windows | macOS (beta) | Linux |
|---|---|---|---|
| Tunetoon | `Tunetoon.exe` | `Tunetoon-macos-arm64.zip` (Apple Silicon) · `Tunetoon-macos-x64.zip` (Intel) | `Tunetoon-Linux.AppImage` |
| Multicontroller | `Multicontroller.exe` | `Multicontroller-macos-arm64.zip` (Apple Silicon) · `Multicontroller-macos-x64.zip` (Intel) | `Multicontroller-Linux.AppImage` (beta) |

There is no installer. Each download is a single self-contained program. Put it in a folder and run it.

## Install and first run

### Windows

1. Download the `.exe` and drop it in a folder of your choice.
   - Keep **Multicontroller.exe** in its own folder. It saves its settings in a file next to the exe.
   - **Tunetoon** stores its data under `%LocalAppData%\Tunetoon`, so you can move or overwrite the exe freely without losing your accounts.
2. On the first run of a new version, Windows SmartScreen may show a blue "Windows protected your PC" box because the app is not code signed. Click **More info**, then **Run anyway**. You only see this once per version.

### macOS (beta)

The macOS builds are still experimental. Both apps ship two of them: `-macos-arm64.zip` for Apple Silicon and
`-macos-x64.zip` for an Intel Mac.

1. Download the zip for your Mac and unzip it.
2. Drag `Tunetoon.app` (or `Multicontroller.app`) anywhere you like.
3. On first launch, right-click (or Control-click) the app and choose **Open**, then **Open** again. macOS shows a warning because the app is not notarized with Apple. This happens only the first time.
   - On macOS 15 and newer you may instead have to open **System Settings**, go to **Privacy and Security**, and click **Open Anyway**.
4. **Multicontroller only:** it needs **Accessibility** permission before it can drive your game windows. Open **System Settings**, go to **Privacy and Security**, then **Accessibility**, and switch Multicontroller on. You do this once: since 1.1.3 every release is signed with the same identity, so the permission survives updates. If you are updating from 1.1.2 or older, grant it one more time and it sticks from then on.

### Linux

Both apps ship as AppImages: `Tunetoon-Linux.AppImage` and `Multicontroller-Linux.AppImage` (beta).

1. Download the AppImage you want.
2. Make it executable and run it:

   ```bash
   chmod +x Tunetoon-Linux.AppImage
   ./Tunetoon-Linux.AppImage
   ```

   - If it complains that a FUSE library is missing, run it with `--appimage-extract-and-run` instead, or install your distro's `libfuse2` package.
3. Toontown Rewritten runs on Linux directly. Corporate Clash does not, so you need a compatibility layer such as [Bottles](https://usebottles.com/) or Wine to launch Clash toons.

Multicontroller on Linux is beta. It needs an X11 session (it also works under XWayland) and controls native Toontown Rewritten windows out of the box. Corporate Clash runs under Wine, so Clash support is experimental: run Clash on the host display (turn off the nested display option in Tunetoon) for Multicontroller to reach its windows.

## Staying up to date

On Windows and macOS you only need to download from here once. Both apps check for a newer release when they
start, and you can also check any time from **About > Check for updates**. Updates download and install in place,
then relaunch the app. On macOS the in-app update does not retrigger the first-launch warning, and from 1.1.3 on it keeps
Multicontroller's Accessibility permission too. Updating from 1.1.2 or older resets it one last time.

On Linux, Multicontroller updates itself in place like the other builds: it swaps its own AppImage and relaunches. Tunetoon on Linux is manual for now: it tells you when a new version is out, and you download the new AppImage from the releases page.

## Verifying a download

Every release ships a single `SHA256SUMS.txt` covering all of that version's downloads, so you can confirm yours is intact.

On Windows PowerShell:

```powershell
Get-FileHash .\Tunetoon.exe -Algorithm SHA256
```

On macOS or Linux:

```bash
shasum -a 256 Tunetoon-Linux.AppImage
```

Compare the printed hash against the matching line in the checksum file.
