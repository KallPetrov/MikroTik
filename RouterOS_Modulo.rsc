#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Modulo function 

:global Modulo do={

    :local truncated;
    :local reminder;

    :set $truncated ($number / $modulo);
    :set $reminder ($number - ($modulo * $truncated));

    :return $reminder
}

$Modulo number=number_to_be_devided modulo=modulo_value;