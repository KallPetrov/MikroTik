#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Measures script execution time

:global MeasureExecutionTime do={

    :local timeDifferance; 
    :local startTime [/system clock get time];
    
    /system script run $scriptName; 

    :local endTime [/system clock get time]
    :set $timeDifferance ($endTime-$startTime);

    :if($return) do={

        :return $timeDifferance; 

    }\
    else={

        :put ("Script executed in : ".$timeDifferance);

    }

    :set $timeDifferance;

}

$MeasureExecutionTime scriptName=scriptName return=true;