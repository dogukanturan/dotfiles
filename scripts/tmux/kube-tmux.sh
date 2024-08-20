#!/bin/bash

defaultColor="fg=#1A1A1A,bg=blue"
testColor="fg=#1A1A1A,bg=cyan"
stagingColor="fg=#1A1A1A,bg=orange"
prodColor="fg=#1A1A1A,bg=#ff0048"

function main(){
    local clusterName=$(kubectl ctx -c)
    local clusterNamespace=$(kubectl ns -c)

    if echo "$clusterName" | grep "test"; then
        echo "#[$testColor] ${clusterName}:${clusterNamespace} #[$testColor]"
    elif echo "$clusterName" | grep "staging"; then
        echo "#[$stagingColor] ${clusterName}:${clusterNamespace} #[$stagingColor]"
    elif echo "$clusterName" | grep "prod"; then
        echo "#[$prodColor] ${clusterName}:${clusterNamespace} #[$prodColor]"
    else
        clusterName=$(kubectl ctx -c)
        echo "#[$defaultColor] ${clusterName}:${clusterNamespace} #[$defaultColor]"
    fi
}

main
