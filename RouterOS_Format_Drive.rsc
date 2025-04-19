#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Formats RouterOS additional drive 

:global FormatDrive do={

    :local driveLabel [/disk get number=$drive label];

    :log warning ("...:::Drive ".$drive." ".$driveLabel." will be formatted!");
    
    /disk eject-drive $drive;
    /disk format-drive $drive file-system=$fileSystem label=$label;

    :log info ("...:::Drive ".$drive." has been formatted to ".$fileSystem." with label ".$label);

}

$FormatDrive drive=0 fileSystem=ext3 label=data; 
