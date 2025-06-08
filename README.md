# Autoscroll for Wayland - Arch Linux Package

## Project Description
System-wide middle mouse button autoscrolling for GNOME Wayland using sxhkd and ydotool.

## Features
- Middle mouse button autoscrolling
- Configurable scroll speed and direction
- Toggle on/off with customizable hotkey
- Works on Wayland environments

## Installation

### From AUR
```
paru -S autoscroll-wayland
```

### Manual Installation
```
git clone https://github.com/fivenine/autoscroll-wayland.git
cd autoscroll-wayland
makepkg -si
```

## Configuration
Edit `~/.config/autoscroll.conf`:
```
# Scroll speed multiplier (default 2)
SCROLL_SPEED=2

# Enable/disable directions (1=on, 0=off)
ENABLE_VERTICAL=1
ENABLE_HORIZONTAL=0

# Toggle key (sxhkd format)
TOGGLE_KEY=F8
```

## Usage
- Hold middle mouse button to scroll
- Press toggle key (default F8) to enable/disable

## Troubleshooting

### Common Fixes
1. Log out and back in after install
2. Verify in input group: `groups | grep input`
3. Check if sxhkd is running: `pgrep sxhkd`

### Permission Issues
```
sudo usermod -aG input $(whoami)
```

## Contributing
1. Fork the repository
2. Create a feature branch
3. Commit changes
4. Open a pull request

## License
MIT - See LICENSE file
