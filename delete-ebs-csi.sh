#!/bin/sh

export CLUSTER_NAME='kubehub-cluster-01'
export ROLE_NAME=AmazonEKS_EBS_CSI_DriverRole
export SA_NAME=ebs-csi-controller-sa
export POLICY_NAME=AwsEBSCSIDriverPolicy

export POLICY_ARN=$(aws iam list-policies --query 'Policies[?PolicyName==`AwsEBSCSIDriverPolicy`].Arn' --output text)
export ROLE_ARN=$(aws iam list-roles --query 'Roles[?RoleName==`AmazonEKS_EBS_CSI_DriverRole`].Arn' --output text)

echo "Deleting IAM Role and Policies"
# Delete IAM Role and Policies
aws iam detach-role-policy --role-name=${ROLE_NAME}  --policy-arn=${POLICY_ARN}
aws iam delete-role --role-name=${ROLE_NAME}
aws iam delete-policy --policy-arn=${POLICY_ARN}

echo "Deleting Service Account"
# Delete the service account
kubectl delete sa -n kube-system ${SA_NAME}

# Delete the ebs-csi addon
eksctl delete addon \
    --name aws-ebs-csi-driver \
    --cluster ${CLUSTER_NAME} 

    

