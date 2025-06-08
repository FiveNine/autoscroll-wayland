pkgname=autoscroll-wayland
pkgver=2.0
pkgrel=1
pkgdesc="Configurable system-wide autoscrolling for GNOME Wayland"
arch=('any')
url="https://github.com/fivenine/autoscroll-wayland"
license=('MIT')
depends=('sxhkd' 'ydotool' 'xdotool' 'xsel' 'xorg-xinput' 'libnotify')
source=('autoscroll.sh'
        'autoscroll-toggle.sh'
        'generate-sxhkdrc'
        'autoscroll.conf.example'
        'autoscroll.desktop')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
install=autoscroll.install

package() {
    install -Dm755 "$srcdir/autoscroll.sh" "$pkgdir/usr/bin/autoscroll"
    install -Dm755 "$srcdir/autoscroll-toggle.sh" "$pkgdir/usr/bin/autoscroll-toggle"
    install -Dm755 "$srcdir/generate-sxhkdrc" "$pkgdir/etc/autoscroll/generate-sxhkdrc"
    
    install -Dm644 "$srcdir/autoscroll.conf.example" "$pkgdir/etc/autoscroll/autoscroll.conf.example"
    install -Dm644 "$srcdir/autoscroll.desktop" "$pkgdir/etc/autoscroll/autoscroll.desktop"
    
    touch "$pkgdir/etc/autoscroll/sxhkdrc"
    chmod 644 "$pkgdir/etc/autoscroll/sxhkdrc"
    
    mkdir -p "$pkgdir/etc/skel/.config/autostart"
    ln -s /etc/autoscroll/autoscroll.desktop \
          "$pkgdir/etc/skel/.config/autostart/autoscroll.desktop"
}
