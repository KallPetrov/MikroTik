#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Creates new backup file and uploads it to MikroTik Cloud

:global CloudBackup do={

    :local systemName [/system identity get value-name=name];
    :local backupNumber [/system backup cloud print count-only];

    :if ($backupNumber = 0) do={

        :log info "...:::No Cloud Backup Present!:::...";
        :log info "...:::Cloud backup process started:::...";
        
        /system backup cloud upload-file action=create-and-upload name=$systemName password=$password;

        :log info "...:::Cloud Backup Created:::...";

    }

    :if ($backupNumber > 0) do={

        :log warning "...:::Cloud Backup Present!:::...";
        :log info "...:::Cloud backup process started:::...";

        :log warning "...:::Removing current slot!:::...";
        /system backup cloud remove-file 0;
        :log warning "...:::Slot removed:::...";

        :log info "...:::Cloud backup process started:::...";
        /system backup cloud upload-file action=create-and-upload name=$systemName password=$password; 

        :log info "...:::Cloud Backup Created:::...";

    }
}

$CloudBackup password=password