# ocp4-tencent-install-disconnected

### 0 - Cloud Infra

#### 0.1 - Script Validation
```bash
terraform -chdir=0-cloud-infra init
```
```bash
terraform -chdir=0-cloud-infra validate
```
#### 0.2 - Infrastructure Provisioning
```bash
terraform -chdir=0-cloud-infra plan -out=plan-0
```
```bash
terraform -chdir=0-cloud-infra apply "plan-0"
```

### 1 - Registry

#### 1.1 - Script Validation
```bash
terraform -chdir=1-registry init
```
```bash
terraform -chdir=1-registry validate
```
#### 1.2 - Infrastructure Provisioning
```bash
terraform -chdir=1-registry plan -out=plan-0
```
```bash
terraform -chdir=1-registry apply "plan-0"
```


### 2 - Services Configuration

♦️ Make sure that the __install-config.yaml__ (already updated) and the customised cluster installation program __openshift-install__ are located in the host ${HOME} directory

#### 2.1 - example of __install-config.yaml__
```bash
cat ~/install-config.yaml
```

```yaml
apiVersion: v1
baseDomain: ocp4.com
compute:
- architecture: amd64
  hyperthreading: Enabled
  name: worker
  platform: {}
  replicas: 3
controlPlane:
  architecture: amd64
  hyperthreading: Enabled
  name: master
  platform: {}
  replicas: 3
metadata:
  creationTimestamp: null
  name: a1
networking:
  clusterNetwork:
  - cidr: 10.128.0.0/14
    hostPrefix: 23
  machineNetwork:
  - cidr: 10.0.0.0/16
  networkType: OVNKubernetes
  serviceNetwork:
  - 172.30.0.0/16
platform:
  aws:
    region: eu-central-1
publish: Internal
pullSecret: '{"auths": {"registry.ocp4.com:8443": {"auth": "YWRtaW46cXVheVBhc3MxMjM="}}}'
sshKey: |
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ4hceh2VM92Tyk4tIPIuSKkwGOzhB5KGCxg71o4BJEmVnwIYvoqKrE9wMjpWVV4cpaafGnu2dWvIcqdH318iFhn19DIc/NnUVMNgu47X3gdDDcBHLk4cMroVqtK0sQ49tt1vwQmhK/iri0hXAsgcKuZlIi2QoVjocIR837i5vC+NEDdiG+sh/olYbiGJDuepGRq8D4nK37FsuDQ9LdNfIOoe6hvf5iKLCRXRnHgXMmuOtS68eyJ6ZMg7wXDy2851s7zKajmW5rT37VKM5v0iz/VqTR/QPYuhFXPINxQwyCA9wy0bEJbwoQJLi5ZQdUY3MMgZ+5BIu/oDzlqHleljF
imageContentSources:
- mirrors:
  - registry.ocp4.com:8443/ocp4/openshift4
  source: quay.io/openshift-release-dev/ocp-release
- mirrors:
  - registry.ocp4.com:8443/ocp4/openshift4
  source: quay.io/openshift-release-dev/ocp-v4.0-art-dev
```

#### 2.2 - check on __openshift-install__, how to extract it from the oc command? [HERE](https://gitlab.com/rcardona/ocp4-tasks/-/blob/main/cluster-registry/mirror-registry-commons.md?ref_type=heads#generate-customized-openshift-install-binary-specifically-for-the-mirrored-registry) 
```bash
./openshift-install version
```
```text
./openshift-install 4.16.3
built from commit e1f9f057ce87c1a4a5f3c268812fa4c9dc003cb7
release image registry.ocp4.com:8443/ocp4/openshift4@sha256:3ec3a43ded1decc18134e5677f56037d8929f4442930f5d1156e7a77cdf1b9b3
release architecture amd64
```

#### 2.3 - Script Validation
```bash
terraform -chdir=2-services init
```
```bash
terraform -chdir=2-services validate
```

#### 2.4 - enabling services
```bash
terraform -chdir=2-services plan -out=plan-0
```
```bash
terraform -chdir=2-services apply "plan-0"
```
 
### 5 - Control Plane Provisioning

#### 5.5 - Check on bootstrap process
```bash
./openshift-install wait-for install-complete --log-level debug
```


----