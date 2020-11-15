### Main Variables
  VESTA=${VESTA:"/usr/local/vesta"}
  
### Script Variables 
LONG=true

  checkStructure() {
    local file=$1
    local perms=$2
    
      if [[ "${file: -1}" == '*' ]]; then
        for dirs in $(find ${file} -type f); do
          checkStructure "${dirs}" "${perms}"
        done
      elif [[ "${file: -1}" != '*' ]] && [[ -e "${file}" ]]; then
        local fileName=$(stat -c "%n" "${file}")
        local filePerms=$(stat -c "%a" "${file}")
        
          if [ ! -z "$perms" ]; then
            if [ "${perms}" -ne "${filePerms}" ]; then
              echo "*** $fileName [Found] Permissions ${filePerms} [Wrong] Should Be:${perms}"
            else
              $LONG && echo "  $fileName [Found] Permissions ${filePerms} [Correct]"
            fi 
          else
            $LONG && echo "  $fileName [Found] Permissions ${filePerms} [Not Checked]"
          fi
          
      else
        echo "*** $file is [Missing]"
      fi
  }
  
    checkStructure "/etc/profile.d/vesta.sh" "755"
    checkStructure "/etc/sudoers.d/admin" "440"
    
    checkStructure "$VESTA/conf" "750"
      checkStructure "$VESTA/conf/vesta.conf" "660"
      
    checkStructure "$VESTA/ssl" "755"
      checkStructure "$VESTA/ssl/*" "660"    
      checkStructure "$VESTA/ssl/certificate.crt"
      checkStructure "$VESTA/ssl/certificate.crt"
      
    checkStructure "$VESTA/log" "750"
      checkStructure "$VESTA/log/*" "660"
      checkStructure "$VESTA/log/auth.log"
      checkStructure "$VESTA/log/system.log"
      checkStructure "$VESTA/log/nginx-error.log"
      
    checkStructure "$VESTA/data" "755"
      checkStructure "$VESTA/data/users" "750"
      checkStructure "$VESTA/data/ips" "750"
      checkStructure "$VESTA/data/firewall" "755"
      checkStructure "$VESTA/data/sessions" "770"
      
    checkStructure "$VESTA/data/queue" "750"
      checkStructure "$VESTA/data/queue/backup.pipe" "750"
      checkStructure "$VESTA/data/queue/disk.pipe" "750"
      checkStructure "$VESTA/data/queue/webstats.pipe" "750"
      checkStructure "$VESTA/data/queue/restart.pipe" "750"
      checkStructure "$VESTA/data/queue/traffic.pipe" "750"
