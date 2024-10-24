#!/usr/bin/env bash

if [ -z $1 ]; then
    echo "No args. Exiting..."
    exit
fi

if [ $1 == "use" ]; then
    case "$2" in
        "prod") /usr/bin/kubectl config use-context gke_u1-staging_us-central1-a_main
        ;;
        "stag") /usr/bin/kubectl config use-context gke_theseus-staging-347811_us-central1-a_main
        ;;
        *) echo "Current context: $(/usr/bin/kubectl config current-context)"
        ;;
    esac
    exit
fi

/usr/bin/kubectl $@
