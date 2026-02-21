function k-create-dummy --description "Create dummy deployment and service using kubectl only"

    kubectl create deployment dummy \
        -n default \
        --image=hashicorp/http-echo \
        --dry-run=client -o yaml \
    | kubectl apply -f -

    kubectl patch deployment dummy -n default \
        --type=json \
        -p='[
          {"op":"add","path":"/spec/template/spec/containers/0/args","value":["-text=hello from dummy"]},
          {"op":"add","path":"/spec/template/spec/containers/0/ports","value":[{"containerPort":5678}]}
        ]'

    kubectl expose deployment dummy \
        -n default \
        --name=dummy-svc \
        --port=80 \
        --target-port=5678 \
        --type=ClusterIP
end
