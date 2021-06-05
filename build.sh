#! /bin/bash

build_landingpage() {

    echo "unzip files"
    unzip html5up-aerial.zip -d ./aerial

    echo "build container image"
    docker build . -t landingpagetest

    echo "start minikube"
    minikube start

    echo "add image to minikube"
    minikube image load landingpagetest

    echo "create deployment and service"
    kubectl apply -f kube.yml

    echo "Running on:  http://$(minikube ip):30100"

}

build_landingpage
