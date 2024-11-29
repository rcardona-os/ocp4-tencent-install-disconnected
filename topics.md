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
