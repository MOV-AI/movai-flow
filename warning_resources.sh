#!/bin/bash
one_meg=1048576
mem_available=$(($(getconf _PHYS_PAGES) * $(getconf PAGE_SIZE) / one_meg))

cpus_available=$(grep -cE 'cpu[0-9]+' /proc/stat)
disk_available=$(df / | tail -1 | awk '{print $4}')
warning_resources="false"
if (( mem_available < 4000 )) ; then
  echo
  echo -e "\033[1;33mWARNING!!!: Not enough memory available for Docker.\e[0m"
  echo "At least 4GB of memory required. You have $(numfmt --to iec $((mem_available * one_meg)))"
  echo
  warning_resources="true"
else
  echo "You have $(numfmt --to iec $((mem_available * one_meg))) mem"
fi
if (( cpus_available < 2 )); then
  echo
  echo -e "\033[1;33mWARNING!!!: Not enough CPUS available for Docker.\e[0m"
  echo "At least 2 CPUs recommended. You have ${cpus_available}"
  echo
  warning_resources="true"
else
  echo "You have ${cpus_available} CPUs"
fi
if (( disk_available < one_meg * 10 )); then
  echo
  echo -e "\033[1;33mWARNING!!!: Not enough Disk space available for Docker.\e[0m"
  echo "At least 10 GBs recommended. You have $(numfmt --to iec $((disk_available * 1024 )))"
  echo
  warning_resources="true"
else
  echo "You have $(numfmt --to iec $((disk_available * 1024 ))) free space"
fi
if [[ ${warning_resources} == "true" ]]; then
  echo
  echo -e "\033[1;33mWARNING!!!: You have not enough resources to run MOVAI Studio (see above)!\e[0m"
  echo "Please increase amount of resources available"
  echo
fi
