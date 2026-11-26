### Based on bazzite-nvidia-open (KDE Desktop)
Mainly for my personal use with some programs/KDE customizations added.

### Rebase to this image from Bazzite (KDE Desktop) or Fedora Kinoite
```
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/badams700/bazzite:latest
```

### KDE Window Blur Rules
```
cd ~/Projects
wget https://raw.githubusercontent.com/badams700/bazzite/extra/blur.kwinrule
```

### To install all Flatpaks:
```
flatpak install -y flathub com.onepassword.OnePassword org.gnome.Decibels com.rafaelmardojai.Blanket org.blender.Blender io.github.maniacx.BudsLink com.calibre_ebook.calibre io.github.wartybix.Constrict com.github.huluti.Curtail com.discordapp.Discord com.epicgames.launcher io.github.Faugus.faugus-launcher de.haeckerfelix.Fragments com.github.tenderowl.frog it.mijorus.gearlever org.gimp.GIMP fr.handbrake.ghb io.gitlab.adhami3310.Impression com.makemkv.MakeMKV io.missioncenter.MissionCenter md.obsidian.Obsidian com.obsproject.Studio org.kde.okular org.onlyoffice.desktopeditors org.openrgb.OpenRGB io.github.alainm23.planify org.prismlauncher.PrismLauncher com.protonvpn.www org.raspberrypi.rpi-imager org.vinegarhq.Sober org.mozilla.thunderbird org.gnome.Showtime org.gnome.gitlab.YaLTeR.VideoTrimmer org.waywallen.waywallen app.zen_browser.zen us.zoom.Zoom
```

### Easy Anti-Cheat v2 Kernel Arguments:
```
rpm-ostree kargs --append-if-missing=lockdown=integrity
```
```
rpm-ostree kargs --append-if-missing=sysctl.kernel.kexec_load_disabled=1
```
Reboot, then verify:
```
ujust check-anticheat
```

### Fun KDE Widgets
- CatWalk
- Plasmusic Toolbar
- KDE Control Station
- Simple Separator
- Window Title Reborn
- Panel Colorizer
- Plasma Audio Visualizer
