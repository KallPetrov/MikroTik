#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Adds log entry if file is removed or added 

:global FileToLog do={

    :local fileName "FilesCount.txt";
    :local fileCountOld;
    :local fileCountCurrent; 

    :if ([:len [/file find name=$fileName]] <= 0) do={

        /file print file=$fileName;
        :delay 5;
        /file set $fileName contents=[/file print count-only];

    }\
    else={

        :set $fileCountOld [/file get $fileName contents];
        :set $fileCountCurrent [/file print count-only];

        :if ($fileCountCurrent > $fileCountOld) do={

            :log warning "File has been added";
            /file set $fileName contents=$fileCountCurrent;

        }
        :if ($fileCountCurrent < $fileCountOld) do={

            :log warning "File has been removed";
            /file set $fileName contents=$fileCountCurrent;

        }

    }
}

$FileToLog;