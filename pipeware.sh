sudo add-apt-repository ppa:pipewire-debian/pipewire-upstream
sudo apt update

# Install
sudo apt install pipewire

# To bluetooth support
sudo apt install libspa-0.2-bluetooth

# Libraries
sudo apt install pipewire-audio-client-libraries

# Need to uninstall ofono and phonesim from your system if you have them installed
sudo apt remove ofono
sudo apt remove ofono-phonesim


systemctl --user daemon-reload

# Disable pulseaudio
systemctl --user --now disable pulseaudio.service pulseaudio.socket
systemctl --user mask pulseaudio

# Enable pipewire
#systemctl --user --now enable pipewire-media-session.service
systemctl --user --now enable pipewire pipewire-pulse

systemctl --user restart pipewire




# Back to pulseuadio
#systemctl --user unmask pulseaudio
#systemctl --user --now disable pipewire{,-pulse}.{socket,service}
#systemctl --user --now enable pulseaudio.service pulseaudio.socket
