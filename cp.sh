while $(true); do cp /var/log/pods/$UID/kube-proxy/*.* /mnt/azure/plogshare/$MY_NODE_NAME; done
