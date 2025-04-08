sudo kubeadm reset
sudo rm -rf ~/.kube
# sudo iptables -F && sudo iptables -t nat -F && sudo iptables -t mangle -F
sudo ./firewall_rules.sh
sudo systemctl restart kubelet
sudo kubeadm config images pull
sudo kubeadm init --pod-network-cidr=10.244.0.0/16
export KUBECONFIG=/etc/kubernetes/admin.conf
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
export KUBECONFIG=/etc/kubernetes/admin.conf
sudo kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml
sudo kubectl get nodes
sudo kubectl get pods --all-namespaces
sudo kubeadm token create --print-join-command
# sudo kubectl label node node1.krisub-... node-role.kubernetes.io/worker=worker