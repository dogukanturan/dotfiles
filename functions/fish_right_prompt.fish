function fish_right_prompt
    set last_status $status
    set -l date (date +%H:%m:%S)
    set -l kube_icon '⎈'
    set -l context (kubectl config current-context 2>/dev/null)
    set -l namespace (kubectl config view --minify --output 'jsonpath={..namespace}' 2>/dev/null)

    if test -z "$namespace"
        set namespace default
    end

    if test $last_status -ne 0
        echo -n (set_color red) "⚠️ $last_status "
    end

    switch $context
        case '*prod*'
            set color red
        case '*staging*'
            set color yellow
        case '*test*'
            set color green
        case '*'
            set color blue
    end
    
    echo -n (set_color $color)"$kube_icon $context/$namespace "(set_color normal)
    echo -n " $date"
end

