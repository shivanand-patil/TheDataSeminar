for reference: https://github.com/beacloudgenius/create-vm/tree/main

# ONE VM

```
create-vm -n yyyy \
		-i ~/vms/virsh/base/jammy-server-cloudimg-amd64.img \
		-k ~/.ssh/id_rsa.pub

get-vm-ip yyyy

delete-vm yyyy
```

# multiple VM

```

# CREATE
for n in `seq 1 3`; do
		create-vm -n nilesh$n \
		-i ~/vms/virsh/base/jammy-server-cloudimg-amd64.img \
		-k ~/.ssh/id_rsa.pub \
		-s 40 \
		-b br0
done


# GET IP ADDRESS
for n in `seq 1 3`; do
		get-vm-ip nilesh$n
done


# DESTROY
for n in `seq 1 3`; do
		delete-vm nilesh$n
done


```

# k8s vm

```

# CREATE masters
for n in `seq 101 103`; do
		create-vm -n master-$n \
		-i ~/vms/virsh/base/jammy-server-cloudimg-amd64.img \
		-k ~/.ssh/id_rsa.pub \
		-s 40 \
		-b br0 \
		-c 1
done

# CREATE slaves
for n in `seq 201 203`; do
		create-vm -n slave-$n \
		-i ~/vms/virsh/base/jammy-server-cloudimg-amd64.img \
		-k ~/.ssh/id_rsa.pub \
		-s 40 \
		-b br0 \
		-c 3 \
		-r 8192
done


# GET IP masters
for n in `seq 101 103`; do
		get-vm-ip master-$n
done

# GET IP slaves
for n in `seq 201 203`; do
		get-vm-ip slave-$n
done


# DESTROY masters
for n in `seq 101 103`; do
		delete-vm master-$n
done

# DESTROY slaves

for n in `seq 201 203`; do
		delete-vm slave-$n
done

```

# desktop VM

```
cd ~/vms/virsh/base/
rm image.img

qemu-img create -f qcow2 image.img 250G

virt-install \
  -n ubuntu \
  --description "Ubuntu Desktop Autoinstall" \
  --os-variant ubuntu22.04 \
  --memory 16384 \
  --vcpus 12 \
  --disk path=/home/cloudgenius/vms/virsh/base/image.img,bus=virtio,size=50 \
  --network bridge:br0 \
  --location /home/cloudgenius/Downloads/virshVMimages/ubuntu-22.04.4-desktop-amd64.iso,kernel=casper/vmlinuz,initrd=casper/initrd \
  --extra-args 'console=ttyS0,115200n8 serial autoinstall' \
  --noreboot


```

# manual creation using ISO

```
sudo ls -l /var/lib/libvirt/images

cd ~/vm
qemu-img create -f raw ubucow.qcow2 +32G
sudo chown libvirt-qemu:kvm ubucow.qcow2
sudo chmod 664 ubucow.qcow2

sudo chown libvirt-qemu:kvm /home/cloudgenius/Downloads/ubuntu-22.04.4-live-server-amd64.iso

virt-install \
 --name ubucow \
 --description "ubucow in kvm" \
 --memory 2048 \
 --vcpus 2 \
 --disk path=/home/cloudgenius/vm/ubucow.qcow2,size=32 \
 --cdrom /home/cloudgenius/Downloads/ubuntu-22.04.4-live-server-amd64.iso \
 --graphics vnc \
 --os-variant ubuntu22.04 \
 --virt-type kvm \
 --autostart \
 --network network=kvmbridge

```

The command above tells `virt-install` we want to use VNC to view the VM’s display and give it keyboard/mouse input. Note that you’ll connect to the *host* and not to the guest’s IP address with your VNC client.

First, figure out which port to use.

```

$ virsh vncdisplay ubucow
127.0.0.1:1

```

This tells us that we can connect to the VNC server on the host’s port `5900 + 1`.

It also tells us that the VNC server on this host is listening on `localhost` only. You can use SSH port forwarding to create a tunnel from port `5999` on your desktop to port `5901` on the server:

```
ssh -L 5999:localhost:5901 test.cg.home.arpa
```

Once that’s up and running, you can open your favorite VNC client, connect to `localhost:5999` (no authentication required), and walk through the Ubuntu installer to get your VM up and running.

## Helpful commands [](https://www.dzombak.com/blog/2024/02/Setting-up-KVM-virtual-machines-using-a-bridged-network.html#helpful-commands)

When troubleshooting or trying to understand the network state on your host VM, the following commands are useful:

# misc

```
virsh list
virsh domifaddr yyyy
virsh net-list
virsh net-info kvmbridge
virsh net-dhcp-leases kvmbridge
brctl show br0

```

https://earlruby.org/2023/02/quickly-create-guest-vms-using-virsh-cloud-image-files-and-cloud-init/
https://github.com/earlruby/create-vm?tab=readme-ov-file
https://github.com/earlruby/create-vm.git

sudo apt-get install whois -y
passwd: mkpasswd --method=SHA-512 --rounds=4096
