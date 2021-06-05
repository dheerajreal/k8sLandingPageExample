#! /bin/bash

build_landingpage() {

    echo "Unzip files"
    unzip html5up-aerial.zip -d ./aerial

    echo "Build container image"
    docker build . -t landingpagetest

    echo "Start minikube"
    minikube start

    echo "Add image to minikube"
    minikube image load landingpagetest

    echo "Create deployment and service"
    kubectl apply -f kube.yml

    echo "Running on:  http://$(minikube ip):30100"

}

build_landingpage
