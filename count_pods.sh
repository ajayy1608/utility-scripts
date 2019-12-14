#!/bin/bash

total_pods=0
nodes=$(kubectl get no -o=jsonpath="{range.items[*]}{.metadata.name} {end}")
for node in $nodes;do
  pods=$(kubectl get pods --all-namespaces --no-headers --field-selector spec.nodeName="$node" | wc -l)
  total_pods=$((total_pods + pods))
  echo "Pods on $node: ${pods// /}"
done
echo "------------------------------------------------------------"
echo "Total Pods: $total_pods"
