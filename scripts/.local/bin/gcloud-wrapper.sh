#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "No args. Exiting..."
    exit
fi

if [ $1 == "set-project" ]; then
    case "$2" in
        "prod")
            /usr/bin/gcloud config set project u1-staging
            /usr/bin/kubectl config use-context gke_theseus-staging-347811_us-central1-a_main
        ;;
        "stag")
            /usr/bin/gcloud config set project theseus-staging-347811
            /usr/bin/kubectl config use-context gke_theseus-staging-347811_us-central1-a_main
        ;;
        *) echo "Usage: gcloud set-project <prod|stag>"
        ;;
    esac
    exit
fi

/usr/bin/gcloud $@
