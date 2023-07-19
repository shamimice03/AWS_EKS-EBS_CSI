# AWS-EKS-EBS-CSI

### Summary
The EBS CSI Driver enables Amazon Elastic Kubernetes Service (Amazon EKS) clusters to manage Amazon EBS volumes for persistent storage. It offers several benefits over the traditional in-tree EBS plugin.

### Facts
💡 The EBS CSI Driver is a Container Storage Interface (CSI) driver that allows Amazon EKS clusters to manage the lifecycle of Amazon EBS volumes for persistent storage.

🔄 The difference between `ebs.csi.aws.com` and `kubernetes.io/aws-ebs` volume provisioners: `kubernetes.io/aws-ebs` is the traditional in-tree volume plugin for AWS EBS, while `ebs.csi.aws.com` is the CSI for AWS EBS, offering improved flexibility and stability.

📦 Before CSI, Kubernetes used in-tree volume plugins, but they caused challenges in adding support for new storage systems and presented reliability and security issues. Using the CSI in Kubernetes resolves these problems.

🚀 The existing in-tree EBS plugin is still supported but deprecated. It is recommended to use the CSI driver for creating or maintaining persistent volumes, as it enables Kubernetes to work with any storage device with an interface driver.

⚙️ The installation process for the EBS CSI Driver involves creating an OIDC provider, configuring IAM policies and roles, and deploying the driver using Helm or Amazon EKS add-on.

🗒️ For ease of installation, a script (`ebs-csi.sh`) is provided that installs the EBS CSI Driver on an AWS EKS cluster. Prerequisites include having AWS-CLI, kubectl, and eksctl installed on the system.

📝 After installation, users can create storage classes, persistent volume claims (PVC), and attach PVCs to pods to use EBS volumes for persistent storage.

These steps allow users to effectively manage Amazon EBS volumes within their Amazon EKS clusters using the EBS CSI Driver.

#### For more details : https://towardsaws.com/ebs-csi-driver-amazon-eks-4eab8966dbb4
