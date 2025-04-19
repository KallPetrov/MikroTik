#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Automated download of all latest RouterOS standard packages. 
# Tool recommended to CAPsMAN and DUDE servers

:global AutoSoftwareDownload do={

    /system package update check-for-updates;

    :local packageLatest [/system package update get latest-version];

    :local packages {"mipsbe"; "smips"; "tile"; "powerpc"; "arm"; "x86"; "mmips"};

    :foreach package in=$packages do={

        /tool fetch http-method=get mode=https url=("https://download.mikrotik.com/routeros/".$packageLatest."/routeros-".("$package")."-".$packageLatest.".npk") dst-path=($destinationPath."/routeros-".("$package")."-".$packageLatest.".npk");
        :log info ("...:::Downloading "."/routeros-".("$package")."-".$packageLatest.".npk");
        
    }
}

#Example: 
#$AutoSoftwareDownload destinationPath=destination_path