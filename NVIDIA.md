# NVIDIA + multiple monitors
> Applies to X11 + i3 started with `startx`, no compositor, NVIDIA proprietary driver, more than one monitor.

## Screen tearing at a "random" height
### Symptom
> Games tear on the main monitor, but the tear line sits at a different height every launch (middle, bottom, ...), and sometimes there is no tear at all.  
> Happens in every game (OpenGL and Steam/Proton), not one specific program.

### Cause
> On X11 without a compositor, NVIDIA's OpenGL vsync waits for the vblank of __one__ monitor, and it's not always the one the game is on.  
> Each monitor scans out on its own clock, so their refresh cycles are offset by a random amount every mode-set.  
> If vsync follows the second monitor, the frame swaps while the main monitor is partway down the screen, so the tear sits at that offset.  
> "No tear" just means the offset happened to land in the blanking gap, or the game got a fullscreen page flip.

### Fix (both go in `~/.xinitrc`, before `exec i3`)
1. Make OpenGL vsync follow the main monitor (no latency cost, OpenGL only):
```sh
export __GL_SYNC_DISPLAY_DEVICE=DP-0
```
2. Make the driver composite every frame, which is tear-free for Vulkan/Proton games too (costs ~1 frame of input latency):
```sh
nvidia-settings --assign CurrentMetaMode="DPY-1: nvidia-auto-select @3840x2160 +0+0 {ForceFullCompositionPipeline=On}, DPY-0: nvidia-auto-select @1920x1080 +3840+0 {ForceFullCompositionPipeline=On}" >/dev/null
```

> The connector names, resolutions and positions above are from the desktop with an RTX 5080 (DP-0 = 4K primary, HDMI-0 = 1080p to its right). __They will differ on a new machine.__ Look them up with:
```sh
xrandr                                   # connector names (DP-0, HDMI-0, ...) for __GL_SYNC_DISPLAY_DEVICE
nvidia-settings -q CurrentMetaMode -t    # DPY-n names + current modes/positions for the metamode
```
> The metamode line also sets each monitor's resolution and position, so update it whenever the monitor layout changes, or it will restore the old layout every time X starts.

### Quirks
* `~/.xprofile` is __not__ read when starting X with `startx`; env vars must go in `~/.xinitrc`.
* `__GL_SYNC_DISPLAY_DEVICE` does nothing for Vulkan, which covers most Steam games via Proton/DXVK. That's why fix 2 is needed.
* To test whether a game still tears without fix 2 (e.g. for latency-sensitive games), turn it off for the current session by running the same command with `=Off`.
* Quick check that fix 1 is the issue: `__GL_SYNC_DISPLAY_DEVICE=DP-0 <some GL game>`. If the tear is gone, it was this.
