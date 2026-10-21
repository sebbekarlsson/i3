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

### Fix (in `~/.xinitrc`, before `exec i3`)
> Make OpenGL vsync follow the main monitor (no latency cost, OpenGL only):
```sh
export __GL_SYNC_DISPLAY_DEVICE=DP-0
```

> The connector name is from the desktop with an RTX 5080 (DP-0 = 4K primary, HDMI-0 = 1080p to its right). __It may differ on a new machine.__ Look it up with `xrandr`.

### Don't: ForceFullCompositionPipeline
> Tried 2026-10-18 to cover Vulkan/Proton games too, and reverted 2026-10-21: it gave __major input lag and stuttering__ in Steam games.
```sh
# don't put this in .xinitrc
nvidia-settings --assign CurrentMetaMode="DPY-1: nvidia-auto-select @3840x2160 +0+0 {ForceFullCompositionPipeline=On}, DPY-0: ..."
```
> If it's ever on, turn it off for the current session with the same metamode and `{ForceCompositionPipeline=Off, ForceFullCompositionPipeline=Off}` per monitor. Check with `nvidia-settings -q CurrentMetaMode -t`.

### Quirks
* `~/.xprofile` is __not__ read when starting X with `startx`; env vars must go in `~/.xinitrc`.
* `__GL_SYNC_DISPLAY_DEVICE` does nothing for Vulkan, which covers most Steam games via Proton/DXVK. Those can still tear; there's no good driver-wide fix yet (see above). Per game, exclusive fullscreen (so the driver page-flips) is the thing to try.
* Quick check that the fix is the issue: `__GL_SYNC_DISPLAY_DEVICE=DP-0 <some GL game>`. If the tear is gone, it was this.
