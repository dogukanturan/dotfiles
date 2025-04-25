function kubeconfig-merge-and-backup
    set configFile $argv[1]
    set tempKubeConfigName ~/kubeconfig-merged
    set kubeConfigPath ~/.kube/config
    set kubeConfigBackupFileName ~/.kube/config-bak

    if test -z "$configFile"
        echo -e "Usage:\n\t$0 CONFIGFILE (Provide the path to the kubeconfig file to be merged.)"
        echo -e "Example:\n\t$0 ~/new-config"
        return 2
    else
        cp $kubeConfigPath $kubeConfigBackupFileName
        kubectl konfig merge $kubeConfigPath $configFile > $tempKubeConfigName
        mv $tempKubeConfigName $kubeConfigPath
        echo "success"
        return 0
    end
end

function k-resource-on
    if test -z "$argv[1]"
        echo "Example: k-resource-on node1"
        return 1
    end

    set NODE_NAME $argv[1]
    kubectl top pod -A | grep -E (kubectl get pods -A -o wide | grep $NODE_NAME | awk '{print $2}' | paste -sd '|' -) | sort -k4 -hr
end

function ssh-config-copy
    set user $argv[1]
    set host_name $argv[2]
    set ip_address $argv[3]

    if test -z "$user" -o -z "$host_name" -o -z "$ip_address"
        echo "Usage: ssh-config-copy <username> <hostname> <ip_address>"
        return 1
    end

    ssh-copy-id "$user@$ip_address"
    if test $status -eq 0
        echo -e "Host $host_name\n\tHostName $ip_address\n\tUser $user" >> ~/.ssh/config
        echo "SSH configuration added for $host_name."
    else
        echo "ssh-copy-id failed."
        return 1
    end
end
