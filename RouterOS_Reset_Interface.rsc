#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Reset interface if particular IP does not respond 

:global ResetInterface do={

    :if ([/ping $ipAddress interval=1 count=4] > 0) do={
        
            :log info "...:::Interface healthcheck. Status OK:::..."
        
        }\
        else={
            
            :log error ("...:::Monitor detected ".$interfaceName." down. Resetting:::...");
            /interface ethernet disable $interfaceName;
            :delay 3;
            /interface ethernet enable $interfaceName;

        }
}      

$ResetInterface ipAddress=ipAddress_To_Monitor interfaceName=interface_name;