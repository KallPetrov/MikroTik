#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Changes LCD mode based on time schedule 

:global ChangeLcd do={

    :local systemTime [/system clock get value-name=time];
    :local lcdMode [/lcd get color-scheme];

    :local lightModeStart $lightModeStartTime;
    :local darkModeStart $darkModeStartTime;

    :if ($systemTime = $lightModeStart && $lcdMode = "dark") do={

        /lcd set color-scheme=light;
        /log info "..::Changed LCD mode to LIGHT::.."
    
    }
    :if ($systemTime = $darkModeStart && $lcdMode = "light") do={

        /lcd set color-scheme=light;
        /log info "..::Changed LCD mode to DARK::.."

    }
}

$ChangeLcd lightModeStartTime="08:00:00" darkModeStartTime="17:00:00";