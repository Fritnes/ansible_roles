#/bin/bash
systemctl disable snapd.service
systemctl disable snapd.socket
systemctl disable snapd.seeded.service

snap remove firefox
snap remove gnome-3-38-2004
snap remove core20
snap remove gtk-common-themes
snap remove bare
snap remove snapd

rm -rf /var/cache/snapd/
apt autoremove --purge snapd
rm -rf ~/snap

cat >/etc/apt/preferences.d/firefox-no-snap <<EOL
Package: firefox*
Pin: release o=Ubuntu*
Pin-Priority: -1
EOL

apt remove imagemagick imagemagick-6-common imagemagick-6.q16 kate gimp gwenview kontrast libreoffice okular akregator kdeconnect kmail konqueror \
        dragonplayer juk k3b kaddressbook korganizer apper plasma-discover -y

apt autoremove -y

apt update -y; apt upgrade -y
add-apt-repository ppa:mozillateam/ppa -y
apt update -y
apt install flatpak firefox ansible -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.google.Chrome -y
flatpak install flathub com.github.tchx84.Flatseal -y
flatpak install flathub org.remmina.Remmina -y
flatpak install flathub com.github.micahflee.torbrowser-launcher -y
flatpak install flathub org.keepassxc.KeePassXC -y
flatpak install flathub org.kde.kwrite -y
flatpak install flathub dev.pulsar_edit.Pulsar -y
flatpak install flathub org.kde.gwenview -y
