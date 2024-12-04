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

⛔️ &#x2003;Make sure that the __install-config.yaml__ (already updated) and the customised cluster installation program __openshift-install__ are located in the host ${HOME} directory

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
  none: {}
publish: External
pullSecret: '{"auths": {"registry.ocp4.com:8443": {"auth": "YWRtaW46cXVheVBhc3MxMjM="}}}'
sshKey: |
  ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCQ4hceh2VM92Tyk4tIPIuSKkwGOzhB5KGCxg71o4BJEmVnwIYvoqKrE9wMjpWVV4cpaafGnu2dWvIcqdH318iFhn19DIc/NnUVMNgu47X3gdDDcBHLk4cMroVqtK0sQ49tt1vwQmhK/iri0hXAsgcKuZlIi2QoVjocIR837i5vC+NEDdiG+sh/olYbiGJDuepGRq8D4nK37FsuDQ9LdNfIOoe6hvf5iKLCRXRnHgXMmuOtS68eyJ6ZMg7wXDy2851s7zKajmW5rT37VKM5v0iz/VqTR/QPYuhFXPINxQwyCA9wy0bEJbwoQJLi5ZQdUY3MMgZ+5BIu/oDzlqHleljF
additionalTrustBundle: |
  -----BEGIN CERTIFICATE-----
  MIID2TCCAsGgAwIBAgIUCRbpVQ4DNl80WtUliK1VrJ+rdpMwDQYJKoZIhvcNAQEL
  BQAwazELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAlZBMREwDwYDVQQHDAhOZXcgWW9y
  azENMAsGA1UECgwEUXVheTERMA8GA1UECwwIRGl2aXNpb24xGjAYBgNVBAMMEXJl
  Z2lzdHJ5Lm9jcDQuY29tMB4XDTI0MTIwNDA3NDcxMloXDTI3MDkyNDA3NDcxMlow
  azELMAkGA1UEBhMCVVMxCzAJBgNVBAgMAlZBMREwDwYDVQQHDAhOZXcgWW9yazEN
  MAsGA1UECgwEUXVheTERMA8GA1UECwwIRGl2aXNpb24xGjAYBgNVBAMMEXJlZ2lz
  dHJ5Lm9jcDQuY29tMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAkWlk
  YY2hL8NJ79h1s3WzauDl1Ou17SBhGl6VHMn/3YXz/CwuUS0S/H1QtRrg/U5vqSlO
  4nXcu8HocNC8sEZdtpR/I2xH+VUFtCwLjcZep31+UtGNIHt10FWoE2yFCjLc2xKJ
  MRn5gknQZhu3B2NKvPHuGqj15qc+z8cFYteJ4rzHn9YaInSzehFRLaPw+SaNt88T
  3OJ9vzmQkMad5t7fThLk9AWobFJhry6doFesI/pf4ssvs0MeFPpB74RZoIw4Btcc
  X5DOd1owNjFWG2z5+OnTtpzKJRAQdni78DrlNcl0UiIE64eOtrWDNsvVE3aqy5rb
  hfBRYF3YrffMWu25aQIDAQABo3UwczALBgNVHQ8EBAMCAuQwEwYDVR0lBAwwCgYI
  KwYBBQUHAwEwHAYDVR0RBBUwE4IRcmVnaXN0cnkub2NwNC5jb20wEgYDVR0TAQH/
  BAgwBgEB/wIBATAdBgNVHQ4EFgQUWmUR0HRUF6dbqEVhA+X+BxvvdlowDQYJKoZI
  hvcNAQELBQADggEBABgfDghh++n11ByIxffk8eKXKyyzHXHx4yUCPAtYFFWsl9Qp
  QO5yGr9PISquuI0Joz7B6TDiS0Div3UdpYZDG3OStWr3pMJPQHS7UHVAjqI284qX
  SYE1H4xinjFhDE9NeZSyDmdBRBnovut/wv4d4V/naUX7BV07yodxjdBBcO3ctxne
  THqkFrzlIkTRUEzXp9drGmIZiWOJ3zzhZilxXFcYraroRIu4i7X8fS2Wc355WqEN
  8eYX9ML15rtduzAK4LIb5pOaMD+SO1P+wsBzo/yWXm982vJxgqbb7j/KgEjYN8F+
  iDkB5NqFvVdyfLZepPrTFPsmHHgYriMasXpshK0=
  -----END CERTIFICATE-----
imageDigestSources:
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
 
### 3 - OCP Infra

#### 3.1 - Script Validation
```bash
terraform -chdir=3-ocp-infra init
```
```bash
terraform -chdir=3-ocp-infra validate
```

#### 3.2 - enabling services
```bash
terraform -chdir=3-ocp-infra plan -out=plan-0
```
```bash
terraform -chdir=3-ocp-infra apply "plan-0"
```

### 4 - Bootstraping

#### 4.1 - Script Validation
```bash
terraform -chdir=4-bootstrap init
```
```bash
terraform -chdir=4-bootstrap validate
```

#### 4.2 - enabling services
```bash
terraform -chdir=4-bootstrap plan -out=plan-0
```
```bash
terraform -chdir=4-bootstrap apply "plan-0"
```

### 5 - Control Plane Provisioning

#### 5.1 - Script Validation
```bash
terraform -chdir=5-master init
```
```bash
terraform -chdir=5-master validate
```

#### 5.2 - enabling services
```bash
terraform -chdir=5-master plan -out=plan-0
```
```bash
terraform -chdir=5-master apply "plan-0"
```

#### 5.3 - Check on bootstrap process
```bash
./openshift-install wait-for install-complete --dir ${CLUSTERNAME} --log-level debug
```

### 6 - Data Plane Provisioning

#### 6.1 - Script Validation
```bash
terraform -chdir=6-worker init
```
```bash
terraform -chdir=6-worker validate
```

#### 6.2 - enabling services
```bash
terraform -chdir=6-worker plan -out=plan-0
```
```bash
terraform -chdir=6-worker apply "plan-0"
```
----