#### - getting the arctifact on linux
```bash
wget https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64
echo "Program yq downloaded"
sudo mv yq_linux_amd64 /usr/local/bin/yq
sudo chmod +x /usr/local/bin/yq

export OCPCLUSTER=$(yq eval -o=json install-config.yaml | jq -r '.metadata.name')
mkdir ${OCPCLUSTER}

cp install-config.yaml ${OCPCLUSTER}/
${HOME}/openshift-install create ignition-configs --dir=${OCPCLUSTER} 
echo "Installing Ignition files into web path"
cp -f ${OCPCLUSTER}/*.ign /var/www/html/
chmod a+r /var/www/html/*.ign
```

#### - validate all terraform file structure
```bash
for FOLDER in 0-cloud-infra 1-registry 2-services 3-ocp-infra 4-bootstrap 5-master 6-worker
do
echo "Phase: ${FOLDER}"
tf -chdir=${FOLDER} validate
done
```

#### - destroy all infrastructure
```bash
for FOLDER in 6-worker 5-master 4-bootstrap 3-ocp-infra 2-services 1-registry 0-cloud-infra
do
echo "Phase: ${FOLDER}"
tf -chdir=${FOLDER} destroy
done
```

#### - fetch coreos image from Red Hat public registry
```bash
wget https://mirror.openshift.com/pub/openshift-v4/dependencies/rhcos/4.17/latest/rhcos-qemu.x86_64.qcow2.gz
```