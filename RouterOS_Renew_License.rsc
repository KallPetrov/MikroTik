#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Renews RouterOS License 

:global RenewLicense do={

    :local currentLicenseLevel [/system license get value-name=level];

    :if ($currentLicenseLevel = "free") do={

        /system license renew account=$account password=$password level=$level;
        :log info ("Renewing license for ".$account." to ".$level);

    }
}

$RenewLicense account=account password=password level=level;