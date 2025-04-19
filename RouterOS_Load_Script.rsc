#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Loads function to RouterOS environment 

:global LoadScript do={

    
    :if ([:len [/file find name=$scriptName]] <= 0) do={
        
        :log info ($scriptName." not found, make sure file exists!");
    
    }

    :if ([:len [/file find name=$scriptName]] > 0) do={
        
        :log info ($scriptName." found. Executing!");
        /system script run $scriptName; 
        
    }

}

$LoadScript scriptName=scriptName.rsc;



