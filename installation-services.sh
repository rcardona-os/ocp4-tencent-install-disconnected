#!/bin/bash
IFS=","

# Loading the variables
source ocp4_install_env.sh

#### EXTRA CONFs ###
OCP_REGISTRY_STORAGE_TYPE='nfs'
WEBROOT='/var/www/html'
AIRGAP_REPO='ocp4/openshift4'
AIRGAP_SECRET_JSON='pull-secret.json'


usage() {
    echo " ---- Script Descrtipion ---- "
    echo "  "
    echo " This script configures the current workstation to serve as bastion host. It will serve the web server for the Openshift Cluster installation architifacts"
    echo " "
    echo " Pre-requisites: "
    echo " "
    echo -e " Make sure that all variables in \e[1;32m ocp4-install.env \e[0m are updated and loaded in the environment"
    echo " "
    echo " Options:  "
    echo " "
    echo " * configure-web-server: configures the http server that will serve the installation artifacts"
    echo " * create-ignition-files: creates the ignition files for the infrastructre provisioning"
    
    echo "  "
    echo -e " Usage: $0 [ configure-web-server | create-ignition-files  | all-installation-services ] "
    echo "  "
    echo " ---- Ends Descrtipion ---- "
    echo "  "
}

check_deps (){
    if [[ ! $(rpm -qa wget git bind-utils lvm2 lvm2-libs net-utils firewalld | wc -l) -ge 7 ]] ;
    then
        install_tools
    fi
}

get_artifacts() {
    cd ~/
    test -d artifacts || mkdir artifacts ; cd artifacts
    test -f openshift-client-linux-${OCP_SUBRELEASE}.tar.gz  || curl -J -L -O https://mirror.openshift.com/pub/openshift-v4/clients/${OCP_RELEASE_PATH}/${OCP_SUBRELEASE}/openshift-client-linux-${OCP_SUBRELEASE}.tar.gz
    test -f openshift-install-linux-${OCP_SUBRELEASE}.tar.gz || curl -J -L -O https://mirror.openshift.com/pub/openshift-v4/clients/${OCP_RELEASE_PATH}/${OCP_SUBRELEASE}/openshift-install-linux-${OCP_SUBRELEASE}.tar.gz
    cd ..
    prep_installer
}

configure-web-server() {
    if [[ $(rpm -qa httpd | wc -l) -ge 1 ]] ;
    then
        if ! grep -q -i "Listen 8080" /etc/httpd/conf/httpd.conf;
            then
                sed -i -e 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf
        fi
            systemctl enable httpd
            systemctl restart httpd
            echo > /var/www/html/index.html
            echo -e "\e[1;32m HTTP - HTTP Server Configuration: DONE \e[0m"
    else
        install_tools
        prep_http
    fi
}



install_tools() {
    #RHEL9
    if grep -q -i "release 9" /etc/redhat-release; then
        dnf -y install podman skopeo httpd bind-utils net-tools rpcbind wget tree jq
        echo -e "\e[1;32m Packages - Dependencies installed\e[0m"
    fi
}



prep_ignition_files() {
    cd ~/
    echo "Creating and populating installation folder"
    mkdir ${CLUSTER_NAME}
    cp install-config.yaml ${CLUSTER_NAME}
    echo "Generating ignition files"
    openshift-install create ignition-configs --dir=${CLUSTER_NAME}
    echo "Installing Ignition files into web path"
    test -d ${WEBROOT} || prep_http
    cp -f ${CLUSTER_NAME}/*.ign ${WEBROOT}
    test -d ${WEBROOT} && chmod a+r ${WEBROOT}/*.ign
}

prep_installer () {
    cd ~/
    echo "Uncompressing installer and client binaries"
    test -d ~/bin/ || mkdir ~/bin/
    tar -xzf ./artifacts/openshift-client-linux-${OCP_SUBRELEASE}.tar.gz  -C ~/bin
    tar -xaf ./artifacts/openshift-install-linux-${OCP_SUBRELEASE}.tar.gz -C ~/bin
}





echo -e "\e[1;32m Registry - Container Registry Configuration: DONE \e[0m"

  echo -e "$AIRGAP_REG \e[1;31m FAIL - DNS Record not found! \e[0m"





all_installation_services(){
    get_artifacts
    configure_web_server
    create_ignition_files
}

key="$1"

case $key in
    get-artifacts)
        get_artifacts
        ;;
    configure-web-server)
        configure_web_server
        ;;
    create-ignition-files)
        create_ignition_files
        ;;
    all-installation-services)
        all_installation_services
        ;;
    *)
        usage
        ;;
esac

##############################################################
# END OF FILE
##############################################################
