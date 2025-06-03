#!/bin/bash

function kubeconfig_merge_and_backup() {
    local configFile="$1"
    local tempKubeConfigName=~/kubeconfig-merged
    local kubeConfigPath=~/.kube/config
    local kubeConfigBackupFileName=~/.kube/config-bak

    if [[ -z "$configFile" ]]; then
        echo -e "Usage:\n\t$0 CONFIGFILE (Provide the path to the kubeconfig file to be merged.)"
        echo -e "Example:\n\t$0 ~/new-config"
        return 2
    else
        cp "$kubeConfigPath" "$kubeConfigBackupFileName"
        kubectl konfig merge "$kubeConfigPath" "$configFile" > "$tempKubeConfigName"
        mv "$tempKubeConfigName" "$kubeConfigPath"
        echo "success"
        return 0
    fi
}

function k_resource_on() {
    if [[ -z "$1" ]]; then
        echo "Example: k_resource_on node1"
        return 1
    fi

    local NODE_NAME="$1"
    kubectl top pod -A | grep -E "$(kubectl get pods -A -o wide | grep "$NODE_NAME" | awk '{print $2}' | paste -sd '|' -)" | sort -k4 -hr
}

function ssh_config_copy() {
    local user="$1"
    local host_name="$2"
    local ip_address="$3"

    if [[ -z "$user" || -z "$host_name" || -z "$ip_address" ]]; then
        echo "Usage: ssh_config_copy <username> <hostname> <ip_address>"
        return 1
    fi

    ssh-copy-id "$user@$ip_address"
    if [[ $? -eq 0 ]]; then
        {
            echo "Host $host_name"
            echo "    HostName $ip_address"
            echo "    User $user"
        } >> ~/.ssh/config
        echo "SSH configuration added for $host_name."
    else
        echo "ssh-copy-id failed."
        return 1
    fi
}

