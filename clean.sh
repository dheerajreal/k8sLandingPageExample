#! /bin/bash

cleanup_landingpage() {

    echo "Delete service and deployment"
    kubectl delete -f kube.yml

    echo "remove image from minikube"
    minikube image rm landingpagetest

    echo "stop minikube"
    minikube stop

    echo "remove container image"
    docker rmi landingpagetest:latest

    echo "cleanup files"
    rm -rf ./aerial

    echo "cleanup complete"
}

cleanup_landingpage
