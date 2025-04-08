sudo ufw enable
sudo ufw allow 6443/tcp
sudo ufw allow 2379/tcp
sudo ufw allow 2380/tcp
sudo ufw allow 10250/tcp
sudo ufw allow 10251/tcp
sudo ufw allow 10252/tcp
sudo ufw allow 10255/tcp
# sudo ufw allow 10256/tcp             # Kubelet health checks
# sudo ufw allow 10257/tcp             # Kubernetes scheduler/controller
# sudo ufw allow 10258/tcp             # Kubernetes controller manager
# sudo ufw allow 10259/tcp             # Kubernetes proxy
sudo ufw allow 179/tcp               
# sudo ufw allow 4789/udp              # VXLAN (if using VXLAN backend)
# sudo ufw allow 9000:10000/tcp        # Additional range for Calico node communication
sudo ufw allow 22/tcp
sudo ufw allow OpenSSH
sudo ufw reload

sudo swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
sudo systemctl enable kubelet