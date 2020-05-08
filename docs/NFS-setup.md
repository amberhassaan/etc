# NFS Simple Instructions

## Install NFS Server and Client
On Ubuntu:
```
sudo apt-get install nfs-common nfs-kernel-server
```

## Setup Exports on Server

Create export directory:

```
sudo mkdir /exports
sudo mkdir /exports/projects
```

Add entry in `/etc/fstab`:

```
/home/<username>/projects /exports/projects none bind 0 0
```

Mount exports:

```
sudo mount /export/projects
```

Create an NFS exports entry in `/etc/exports`

```
# add to /etc/exports
/exports/projects        <client-name-or-ip>(rw,sync,no_subtree_check)
```

Enable NFSv4 ID mapping:
```
echo "N" | sudo tee /sys/module/nfsd/parameters/nfs4_disable_idmapping
```

Make ID mapping permanent for reboots by creating a file `/etc/modprobe.d/nfs-idmapping.conf`, and add:

```
# /etc/modprobe.d/nfs-idmapping.conf contents
options nfs nfs4_disable_idmapping=0
options nfsd nfs4_disable_idmapping=0
```

Restart NFS daemon:

```
sudo systemctl restart nfs-server.service
```


## Client Setup
1. Install Packages (see above)
2. Enable ID mapping (see above)
3. Create ID mapping on client by editing `/etc/idmapd.conf`

```
# contents of /etc/idmapd.conf
[General]

Verbosity = 0
Pipefs-Directory = /run/rpc_pipefs
# set your own domain here, if it differs from FQDN minus hostname
# Domain = localdomain

[Translation]
Method=static

[Mapping]

Nobody-User = nobody
Nobody-Group = nogroup

[Static]
mhassaan@mah-hawaii = mhassaan
```

Restart service:
```
sudo systemctl restart nfs-idmapd.service
```

4. Mount the nfs export by adding an entry to `/etc/fstab`
```
# /etc/fstab entry
<server-name-or-ip>:/nfsexports/mhassaan/projects   /home/mhassaan/projects   nfs4 rw,noatime,_netdev   0   0
<server-name-or-ip>:/nfsexports/mhassaan/etc        /home/mhassaan/etc        nfs4 rw,noatime,_netdev   0   0
```

5. Create mount points on the client and mount
```
mkdir /home/mhassaan/etc
sudo mount /home/mhassaan/etc/
df -h
```

