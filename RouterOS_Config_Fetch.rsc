#################################
# RouterOS script
# Copyright (c) 2018-2025 - mikrotik-script.com <RuterBoard@proton.me>
# Last update: 01.03.2025
#################################
# Fetches RouterOS script (dedicated for initial config) adds scheduler entry to start it on startup 

:global FetchConfig do={

    :log info "...:::Configuration fetch process started:::...";

    :do {

        /tool fetch address=$repositoryIP user=$userName password=$password \
        port=21 mode=ftp src-path=($sourcePath.$sourceFileName) dst-path=($destinationPath.$destinationFileName);

    } on-error={

        :put "An error occured when dowloading configuration file!";
        :log critical "...:::An error occured when dowloading configuration file!:::...";

    };

    :if($isRun)do={

        :do {

            :log info "...:::Configuration import started:::...";
            /import ($destinationPath.$destinationFileName);

        } on-error={

            :put "An error occured during configuration import!";
            :log critical "...:::An error occured during configuration import!:::...";

        };
        
        :delay 5;
        :log warning "...:::Import secessful. Rebooting device:::...";
        /system reboot; 

    }\
    else={

        :log info "...:::Configuring import on startup:::...";

        :do {

            /system scheduler \
            add interval=($interval.h) name=$taskName on-event=("system script run ".($destinationPath.$destinationFileName)) \
            policy=ftp,reboot,read,write,policy,test,password,sniff,sensitive,romon \
            start-date=jan/01/1970 start-time=$startTime;

        } on-error={

            :put "An error occured during import job schedule!";
            :log critical "...:::An error occured during import job schedule!:::...";

        }

        :log info "...:::Configuration job scheduled for next startup!:::...";

    }
}

FetchConfig isRun=true;