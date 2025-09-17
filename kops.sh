
#vim .bashrc
#export PATH=$PATH:/usr/local/bin/
#source .bashrc

#! /bin/bash
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -Lo kops https://github.com/kubernetes/kops/releases/download/$(curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | grep tag_name | cut -d '"' -f 4)/kops-linux-amd64
chmod +x kops
sudo mv kops /usr/local/bin/kops
chmod +x kubectl
mv kubectl /usr/local/bin/kubectl

aws s3api create-bucket --bucket vamsi.k8scluster.k8s.local --region us-east-1
aws s3api put-bucket-versioning --bucket vamsi.k8scluster.k8s.local --region us-east-1 --versioning-configuration Status=Enabled
export KOPS_STATE_STORE=s3://vamsi.k8scluster..k8s.local
kops create cluster --name vamsi.k8scluster..local --zones us-east-1a,us-east-1b --master-count=1 --master-size t2.large --master-volume-size=30 --node-count=3 --node-size t2.medium --node-volume-size=20
kops update cluster --name vamsi.k8scluster..local --yes --admin



##INSTALL KUBECTL on LINUX

# For x86-64 systems
#curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"

# For ARM64 systems
##curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/arm64/kubectl"

# Make it executable and move to your PATH
#chmod +x kubectl
#sudo mv kubectl /usr/local/bin/


EKSCTL INSTALLATION:
# Set architecture (use arm64 if you're on ARM-based systems)
ARCH=amd64
PLATFORM=$(uname -s)_$ARCH
# Download the latest release
curl --silent --location "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_${PLATFORM}.tar.gz" | tar xz -C /tmp
# Move the binary to your PATH
sudo mv /tmp/eksctl /usr/local/bin

AWS CLI INSTALLATION:
# Update your system packages
sudo yum update -y   # For Amazon Linux 2
# OR
sudo dnf update -y   # For Amazon Linux 2023

# Install AWS CLI
sudo yum install -y awscli   # Amazon Linux 2
# OR
sudo dnf install -y awscli   # Amazon Linux 2023

aws configure
aws access key :AKIARXX5C2CXZ2CWWVPM
secret access key: O4L4eBxnB9DtqGWdhErsKV9yB1Zltommf3EPV3NWAMISV

