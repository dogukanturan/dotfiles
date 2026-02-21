function k-check
    kubectl get pods -A \
    | awk '$4 !~ /^(Running|Completed|Succeeded)$/ || $5 > 5'
end
