function kgp --description 'Get pods in the currently selected k8s cluster/namespace'
  if count $argv > /dev/null
    # arg passed; get pods and grep
    kubectl get pods | grep $argv[1]
  else
    kubectl get pods
  end
end
