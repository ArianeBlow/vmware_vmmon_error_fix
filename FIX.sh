#!/bin/bash

cd /tmp/

#Fix Host-Header
fix-head ()
{
  sudo apt-get install linux-headers-$(uname -r)
}

#Fix VMMON & VMNET
fix-vmmon ()
{
  wget https://github.com/mkubecek/vmware-host-modules/archive/workstation-16.2.1.tar.gz
  tar -xzf workstation-16.2.1.tar.gz
  cd vmware-host-modules-workstation-16.2.1
  tar -cf vmmon.tar vmmon-only
  tar -cf vmnet.tar vmnet-only
  sudo cp -v vmmon.tar vmnet.tar /usr/lib/vmware/modules/source/
  sudo vmware-modconfig --console --install-all
}

echo "starting"
fix-head
fix-vmmon
echo "fix done ... Starting vmware app"
vmware
