sudo rm -f /etc/apt/sources.list.d/kubernetes.list
sudo rm -f /etc/apt/keyrings/kubernetes-archive-keyring.gpg
echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-archive-keyring.gpg
sudo ls -l /etc/apt/keyrings/kubernetes-archive-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-archive-keyring.gpg
sudo apt update
sudo apt install -y kubelet kubeadm kubectl
sudo kubelet --version
sudo kubeadm version
sudo kubectl version --client
exec bash