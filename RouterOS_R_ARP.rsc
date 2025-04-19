#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# ARP/RARP Function (shortange syntax) 

:global R_ARP do={

    :if ($mode="ARP") do={

        :return [/ip arp print where mac-address=$ip];

    }

    :if ($mode="RARP") do={

        :return [/ip arp print where mac-address=$mac];

    }
}

$R_ARP mode=mode; 
