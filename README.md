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

#### 2 - Services Configuration

♦️ Make sure that the __install-config.yaml__ (already updated) and the customised cluster installation program __openshift-install__ are located in the host ${HOME} directory



----