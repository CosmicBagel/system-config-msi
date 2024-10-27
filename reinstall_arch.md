## reinstalling arch

- need to update fstab
  should look like this, but with UUIDs updated
  make sure boot has at least 1gb so I can install lots of kernels =D

  ```
  # Static information about the filesystems.
  # See fstab(5) for details.

  # <file system> <dir> <type> <options> <dump> <pass>
  # /dev/nvme0n1p2
  UUID=b3335272-fcfd-4675-8b66-af7a739900a2   /           ext4        rw,relatime 0 1

  # /dev/nvme0n1p1
  UUID=8A10-8380          /boot       vfat        rw,relatime,fmask=0022,dmask=0022,codepage=437,iocharset=ascii,shortname=mixed,utf8,errors=remount-ro   0 2

  /swapfile swap swap default 0 0
  ```

- update mirror list with reflector --country Canada,US --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
- make user for yourself, add to group `wheel` (won't do anything yet)
- as non-root git clone dotfiles
- download and unzip https://github.com/CyberShadow/aconfmgr/archive/refs/heads/master.zip
- run `aconfmgr apply -c /home/user/dotfiles/aconfmgr` (probably have to run it as root)

## reinstalling arch (after running aconfmgr apply)

- deploy symlinks as user
- lock root account `passwd -l root`, and ensure in passwd file shell is set to nologin
- rerun mkinitcpio for all three kernels with mkinitcpio -P
- run SwitchNormalConfigs
  - deploy tlp conf (copy preconfigured tlp file from dotfiles)
  - deploy keyd conf

## boot config

in case I need to redo the boot partition
my refind.conf (/boot/EFI/refind/refind.conf)
updated the UUIDs as needed
using refind-theme-regular

```
menuentry "Arch Linux" {
    icon     /EFI/refind/icons/os_arch.png
    loader   /EFI/Arch/vmlinuz-linux
    initrd   /EFI/Arch/initramfs-linux.img

    # reasoning for additional params
    #
    # rw root=...
    # just points kernel at the correct disk partition to use as root
    #
    # pci_aspm=force
    # helps with some devices using a lot more power than they should
    # (particularily ethernet iirc), results in better battery life and a
    # cooler laptop, albiet at slight perf loss in some situations (at least in
    # theory, I haven't noticed any meaningful perf loss, but have measured
    # lower power draw when testing with intel's power utility)
    #
    # pci=noaer
    # prevents unimportant error spam coming from the ethernet adapter
    #
    # preempt=full
    # I primarily use my setup as a desktop environment + gaming, this helps
    # with that by letting demanding apps utilize the CPU more
    options  "rw root=UUID=b3335272-fcfd-4675-8b66-af7a739900a2 pci_aspm=force pci=noaer preempt=full"

    ### Linux Vanilla
    submenuentry "Vanilla - Standard Options (Default)" {
	    loader   /EFI/Arch/vmlinuz-linux
	    initrd   /EFI/Arch/initramfs-linux.img
    }
    submenuentry "Vanilla - Single-User Mode" {
	    loader   /EFI/Arch/vmlinuz-linux
	    initrd   /EFI/Arch/initramfs-linux.img
	    add_options  "single"
    }
}

# uncomment this entry if you are doing a dual boot with windows
#menuentry "Windows" {
#    loader \EFI\Microsoft\Boot\bootmgfw.efi
#}

# Load rEFInd theme Regular
include themes/refind-theme-regular/theme.conf
```
