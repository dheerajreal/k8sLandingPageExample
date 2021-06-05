#! /bin/bash

cleanup_landingpage() {

    echo "Delete service and deployment"
    kubectl delete -f kube.yml

    echo "Remove image from minikube"
    minikube image rm landingpagetest

    echo "Stop minikube"
    minikube stop

    echo "Remove container image"
    docker rmi landingpagetest:latest

    echo "Cleanup files"
    rm -rf ./aerial

    echo "Cleanup complete"
}

cleanup_landingpage
