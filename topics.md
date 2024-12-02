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
````

#### - validate all terraform file structure
```bash
for FOLDER in 0-cloud-infra 1-registry 2-services 3-ocp-infra 4-bootstrap 5-master 6-worker
do
echo "Phase: ${FOLDER}"
tf -chdir=${FOLDER} validate
done
```
