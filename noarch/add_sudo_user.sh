#!/bin/bash
### Create Admin Sudo User - NO ARCH

if [ -z "$(grep /etc/sudoers.d /etc/sudoers)" ]; then
  echo -e "\n#includedir /etc/sudoers.d" >> /etc/sudoers
fi

if [ ! -d "/etc/sudoers.d" ]; then
  mkdir /etc/sudoers.d
  chmod 750 /etc/sudoers.d
fi

echo '### Admin Sudo User - No Arch - Created by VestaCP
Defaults env_keep="VESTA"
Defaults:admin !syslog
Defaults:admin !requiretty
Defaults:root !requiretty

### Limit Sudo to VestaCP Bin
admin   ALL=NOPASSWD:/usr/local/vesta/bin/*' > /etc/sudoers.d/admin
    
chmod 440 /etc/sudoers.d/admin
