IgnorePath '/bin'
IgnorePath '/boot'
IgnorePath '/dev'
IgnorePath '/home'
IgnorePath '/lib'
IgnorePath '/lib64'
IgnorePath '/lost+found'
IgnorePath '/mnt'
IgnorePath '/opt'
IgnorePath '/proc'
IgnorePath '/root'
IgnorePath '/run'
IgnorePath '/sbin'
IgnorePath '/srv'
IgnorePath '/sys'
IgnorePath '/timeshift'
IgnorePath '/tmp'
IgnorePath '/usr'
IgnorePath '/var'

IgnorePath '/swapfile'

# etc ignores (this things are either too ephemeral or automatically added)
IgnorePath '/etc/fonts/*'
IgnorePath '/etc/ssl/certs/*'
IgnorePath '/etc/ca-certificates/*'
IgnorePath '/etc/pacman.d/gnupg/*'
IgnorePath '/etc/NetworkManager/system-connections/*'
IgnorePath '/etc/cups/*'
IgnorePath '/etc/printcap'
IgnorePath '/etc/os-release'
IgnorePath '/etc/machine-id'
IgnorePath '/etc/resolv.conf' #Generated by NetworkManager
IgnorePath '/etc/hostname' #should probably change
IgnorePath '/etc/fstab' # will need to be remade for different parition tables
IgnorePath '/etc/ld.so.cache'
IgnorePath '/etc/modules-load.d/prime-switcher.conf' # changes if dedi card is enabled
IgnorePath '/etc/modprobe.d/prime-switcher.conf' # changes if dedi card is enabled
IgnorePath '/etc/X11/xorg.conf.d/90-prime-switcher.conf' # changes if dedi card is enabled
IgnorePath '/etc/profile.d/prime-switcher.sh' # changes if dedi card is enabled

#I often change this based on a couple of presets I keep
#in my dotfiles

IgnorePath '/etc/.pwd.lock'
IgnorePath '/etc/.updated'
IgnorePath '/etc/adjtime'

#IgnorePath '/etc/group'
IgnorePath '/etc/group-'
IgnorePath '/etc/gshadow'
IgnorePath '/etc/gshadow-'
#IgnorePath '/etc/passwd'
IgnorePath '/etc/passwd-'
IgnorePath '/etc/shadow'
IgnorePath '/etc/shadow-'
#IgnorePath '/etc/subgid'
#IgnorePath '/etc/subuid'
IgnorePath '/etc/subgid-'
IgnorePath '/etc/subuid-'

# updated via reflector --country Canada,US --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
IgnorePath '/etc/pacman.d/mirrorlist'

# odd stuff
IgnorePath '/usr/share/sddm/scripts/Xsetup'
IgnorePath '/usr/lib/vlc/plugins/plugins.dat'
IgnorePath '/usr/share/applications/org.wezfurlong.wezterm.desktop'
IgnorePath '/usr/lib/utempter/utempter'
IgnorePath '/usr/bin/groupmems'
IgnorePath '/var/log/journal'

# sshd keys
IgnorePath '/etc/ssh/ssh_host_*_key'
IgnorePath '/etc/ssh/ssh_host_*_key.pub'
