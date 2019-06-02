# proxylog
A helm chart to get the kube-proxy log.

how to use :

first create storage account in the MC_ of your cluster.

then get the guid of kube-proxy deployment by :
kubectl get pod -n kube-system kube-proxy-kz56j    -o yaml   

apiVersion: v1
kind: Pod
metadata:
  annotations:
    aks.microsoft.com/release-time: 'seconds:1559071170 nanos:710426182 '
    remediator.aks.microsoft.com/kube-proxy-restart: "2"
  creationTimestamp: 2019-06-02T07:02:18Z
  generateName: kube-proxy-
  labels:
    component: kube-proxy
    controller-revision-hash: 885f947df
    pod-template-generation: "4"
    tier: node
  name: kube-proxy-kz56j
  namespace: kube-system
  ownerReferences:
  - apiVersion: apps/v1
    blockOwnerDeletion: true
    controller: true
    kind: DaemonSet
    name: kube-proxy
    uid: 81eb4f88-817d-11e9-b2e1-d21783ed20f2
  resourceVersion: "461992"
  selfLink: /api/v1/namespaces/kube-system/pods/kube-proxy-kz56j
  uid: 5c5ab648-8504-11e9-b2e1-d21783ed20f2 <---- this is the value   
  to run :
  
  use this with rback : https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/aks/kubernetes-helm.md
  
  
  helm install prolog-0.1.0.tgz  --set sa=storage-accountname --set guid=guid  --debug
helm install prolog-0.1.0.tgz  --set sa=proxylog --set guid=c7b5aa5b-847e-11e9-b2e1-d21783ed20f2  --debug

once done you will see the logs in the storage account.

in the share folder.

the results should be :

{"log":"W0602 07:02:20.655104       1 server.go:198] WARNING: all flags other than --config, --write-config-to, and --cleanup are deprecated. Please begin using a config file ASAP.\n","stream":"stderr","time":"2019-06-02T07:02:20.655440465Z"}
{"log":"W0602 07:02:20.658455       1 proxier.go:480] Failed to read file /lib/modules/4.15.0-1045-azure/modules.builtin with error open /lib/modules/4.15.0-1045-azure/modules.builtin: no such file or directory. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules\n","stream":"stderr","time":"2019-06-02T07:02:20.658566371Z"}
{"log":"W0602 07:02:20.659585       1 proxier.go:493] Failed to load kernel module ip_vs with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules\n","stream":"stderr","time":"2019-06-02T07:02:20.659656573Z"}
{"log":"W0602 07:02:20.662582       1 proxier.go:493] Failed to load kernel module ip_vs_rr with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules\n","stream":"stderr","time":"2019-06-02T07:02:20.662651978Z"}
{"log":"W0602 07:02:20.664742       1 proxier.go:493] Failed to load kernel module ip_vs_wrr with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules\n","stream":"stderr","time":"2019-06-02T07:02:20.664834082Z"}
{"log":"W0602 07:02:20.665759       1 proxier.go:493] Failed to load kernel module ip_vs_sh with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules\n","stream":"stderr","time":"2019-06-02T07:02:20.665852084Z"}
{"log":"W0602 07:02:20.666790       1 proxier.go:493] Failed to load kernel module nf_conntrack_ipv4 with modprobe. You can ignore this message when kube-proxy is running inside container without mounting /lib/modules\n","stream":"stderr","time":"2019-06-02T07:02:20.666878085Z"}
{"log":"W0602 07:02:20.674866       1 server_others.go:295] Flag proxy-mode=\"\" unknown, assuming iptables proxy\n","stream":"stderr","time":"2019-06-02T07:02:20.6749402Z"}
{"log":"I0602 07:02:20.766196       1 server_others.go:148] Using iptables Proxier.\n","stream":"stderr","time":"2019-06-02T07:02:20.766317364Z"}
{"log":"I0602 07:02:20.766405       1 server_others.go:178] Tearing down inactive rules.\n","stream":"stderr","time":"2019-06-02T07:02:20.766475664Z"}
{"log":"I0602 07:02:20.789063       1 server.go:483] Version: v1.13.5\n","stream":"stderr","time":"2019-06-02T07:02:20.789156905Z"}
{"log":"I0602 07:02:20.807902       1 conntrack.go:52] Setting nf_conntrack_max to 131072\n","stream":"stderr","time":"2019-06-02T07:02:20.808076239Z"}
{"log":"I0602 07:02:20.808689       1 config.go:202] Starting service config controller\n","stream":"stderr","time":"2019-06-02T07:02:20.80878124Z"}
{"log":"I0602 07:02:20.808705       1 controller_utils.go:1027] Waiting for caches to sync for service config controller\n","stream":"stderr","time":"2019-06-02T07:02:20.80879194Z"}
{"log":"I0602 07:02:20.808726       1 config.go:102] Starting endpoints config controller\n","stream":"stderr","time":"2019-06-02T07:02:20.80879514Z"}
{"log":"I0602 07:02:20.808730       1 controller_utils.go:1027] Waiting for caches to sync for endpoints config controller\n","stream":"stderr","time":"2019-06-02T07:02:20.80879814Z"}
{"log":"I0602 07:02:20.908826       1 controller_utils.go:1034] Caches are synced for endpoints config controller\n","stream":"stderr","time":"2019-06-02T07:02:20.90893022Z"}
{"log":"I0602 07:02:20.908878       1 controller_utils.go:1034] Caches are synced for service config controller\n","stream":"stderr","time":"2019-06-02T07:02:20.909783621Z"}

then you can share it with support.


