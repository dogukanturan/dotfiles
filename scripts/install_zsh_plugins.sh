#!/bin/bash

DATE=$(date "+%F %H:%M:%S")

function usage {
    clear
    echo -e "MAKE A CHOICE\n"
    echo -e "1) ZSH PLUGINS"
    echo -e "2) KUBECTL PLUGINS"
    echo -e "3) TMUX PLUGINS\n"
    read -p "Make a selection: " choice; echo
}

if [[ -z $choice ]]; then
    echo -e "\nPlease enter a number!\n\n"
    usage
fi


function zsh_plugins {
    echo -e "Installing plugin --> zsh-completions"
    git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
    if [[ $? -eq 0 ]]; then 
        echo -e "[+] Plugin successfully installed"
    else 
        echo -e "[-] Plugin failed to install"
    fi


    echo -e "\nInstalling plugin --> zsh-autosuggestions"
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    if [[ $? -eq 0 ]]; then 
        echo -e "[+] Plugin successfully installed"
    else 
        echo -e "[-] Plugin failed to install"
    fi


    echo -e "\nInstalling plugin --> zsh-syntax-highlighting"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    if [[ $? -eq 0 ]]; then 
        echo -e "[+] Plugin successfully installed"
    else 
        echo -e "[-] Plugin failed to install"
    fi


    echo -e "\nInstalling plugin --> kubetail"
    git clone https://github.com/johanhaleby/kubetail.git ~/.oh-my-zsh/custom/plugins/kubetail
    if [[ $? -eq 0 ]]; then 
        echo -e "[+] Plugin successfully installed"
    else 
        echo -e "[-] Plugin failed to install"
    fi

}


function install_krew {
    echo -e "\nKrew is not installed. Installing Krew..."
    (
        set -x; cd "$(mktemp -d)" &&
        OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
        ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
        KREW="krew-${OS}_${ARCH}" &&
        curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
        tar zxvf "${KREW}.tar.gz" &&
        ./"${KREW}" install krew
    )
    export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"
    echo 'export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"' >> ~/.zshrc
    source ~/.zshrc
}


function kubernetes_plugins {
    plugin_list=(
        ctx
        df-pv
        exec-as
        krew
        ns
        score
        sniff
        stern
        tmux-exec
        tree
        view-utilization
        viewnode
        virt
        resource-capacity
        konfig
    )
    if kubectl krew version &> /dev/null; then
        for plugin in "${plugin_list[@]}"; do
            echo -e "$DATE Installing plugin --> ${plugin}"
            kubectl krew install "${plugin}" &> /dev/null
            if [[ $? -eq 0 ]]; then 
                echo -e "[+] Plugin successfully installed\n"
            else 
                echo -e "[-] Plugin failed to install\n"
            fi
        done
    else
        install_krew
        kubernetes_plugins
    fi
}


function tmux_plugins {
    TMUX_DIR=~/.tmux

    if [ ! -d $TMUX_DIR ]; then
        mkdir $TMUX_DIR
        return 1
    fi

    git clone https://github.com/tmux-plugins/tpm $TMUX_DIR/plugins/tpm
    if [[ $? -eq 0 ]]; then
        echo -e "[+] Tmux TPM successfully installed.\n"
    else
        echo -e "[-] Tmux TPM failed to install.\n"
    fi
}

case $choice in
    1) zsh_plugins
    ;;
    2) kubernetes_plugins
    ;;
    3) tmux_plugins
    ;;
    *) usage
    ;;
esac
