#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Substrings variable 

:global Subtring do={

    :global substring;

    :if ($findMode=true) do={

        :set $substring [:pick $string [:find $string $signA] [:find $string $signB]];
        :return $substring; 

    }\
    else={

        :set $substring [:pick $string $signA $signB];
        :return $substring;

    }
}

$Substring findMode=true string="string" signA="A" signB "b";
