#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "No args. Exiting..."
    exit
fi

if [ $1 == "set-project" ]; then
    case "$2" in
        "prod") /usr/bin/gcloud config set project u1-staging
        ;;
        "stag") /usr/bin/gcloud config set project theseus-staging-347811
        ;;
        *) echo "Usage: gcloud set-project <prod|stag>"
        ;;
    esac
    exit
fi

/usr/bin/gcloud $@
