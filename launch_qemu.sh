#!/bin/sh

# Copyright (C) 2021, Modotte
# Version: 0.1.2
# Description: Automatically build a basic dynamic snapshot-based,
# disk image and to launch the operating system on the QEMU VM.

# Change the value of this to your ISO file location.
ISO="../openSUSE-Tumbleweed-DVD-x86_64-Current.iso"

DISK="disk.img"
DISK_FORMAT="qcow2" # This format supports snapshots.

# Increase the disk size (i.e, 80G, 200G) if you wish.
DISK_SIZE="35G"

# Recommended RAM amount to be allocated by the VM(in Mb).
# Default value is roughly 4.1G.
VM_RAM=4120

boot_order="d" # CD-ROM by default

log_info() {
    text="$1"

    bold=$(tput bold)
    blue=$(tput setaf 4)
    normal=$(tput sgr0)
    
    printf "${bold}${blue}[INFO]${normal} %s\n" "$text"
}

if [ ! -f "$DISK" ];then
    log_info "[INFO] Creating disk image"
    qemu-img create -f "$DISK_FORMAT" "$DISK" "$DISK_SIZE"
    log_info "Disk creation completed"
fi

if [ -n "$(du -h $DISK | awk '$1 ~ /M|G$/ {print}')" ];then
    log_info "An operating system has been installed to $DISK"
    log_info "Proceeding to boot from $DISK file directly"
    boot_order="c"
else
    log_info "No operating system got installed to $DISK"
    log_info "Proceeding to boot from $ISO file directly"
fi

boot_qemu() {
    if "$1";then
        log_info "Booting qemu with KVM enabled"
        qemu-system-x86_64 -boot "$boot_order" \
                           -cdrom "$ISO" \
                           -m "$VM_RAM" \
                           -hda "$DISK" \
                           -enable-kvm
    else
        log_info "Booting qemu with default options"
        qemu-system-x86_64 -boot "$boot_order" \
                           -cdrom "$ISO" \
                           -m "$VM_RAM" \
                           -hda "$DISK"
    fi
}

kvm_support_flags='vmx\|svm|0xc0f'
if grep -q "$kvm_support_flags" /proc/cpuinfo;then
    boot_qemu true
else
    boot_qemu false
fi

exit
