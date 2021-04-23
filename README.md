This repo contain ansible playbook and roles to deploy kubernetes on raspberry pi cluster.

To do it, we split the job in two steps.
- Configuring ssh, user, ... with raw raspberry pi
- Configuring K3s cluster

A docker-compose has been written to script those two steps.

to launch the first one:

First generate a ssh key in ssh directory
```bash
mkdir -p ssh
pushd ssh
ssh-keygen <enter><enter><enter>
popd
```

``` bash
docker-compose up ansible
``` 

When the first job succeed

``` bash
docker-compose up k3s 
```
