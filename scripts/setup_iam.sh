#!/usr/bin/env bash

profile=${1:-default}
echo 'Using profile:' \"${profile}\"

create_cluster_roles() {
  aws iam create-role --profile $profile --role-name EKSClusterRole --description 'To enable EKS functionality' --assume-role-policy-document "$(cat ./eks-role-trust-policy.json)"
  aws iam create-role --profile $profile --role-name EKSNodeGroupRole --description 'To enable NodeGroup functionalities' --assume-role-policy-document "$(cat ./node-group-role-trust-policy.json)"
}

# AWS managed policies.
attach_policies() {
  aws iam --profile $profile attach-role-policy --role-name EKSClusterRole --policy-arn arn:aws:iam::aws:policy/AmazonEKSClusterPolicy
  aws iam --profile $profile attach-role-policy --role-name EKSNodeGroupRole --policy-arn arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy
  aws iam --profile $profile attach-role-policy --role-name EKSNodeGroupRole --policy-arn arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly
  aws iam --profile $profile attach-role-policy --role-name EKSNodeGroupRole --policy-arn arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy
}

#create_cluster_roles
attach_policies