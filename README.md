# mediawiki
Project to be used for learning purposes only.
Build on Ubunu 18.04 and mariaDB


## Dockerfiles
* `Dockerfile` - To install and configuring Mediawiki v1.39.2 on a ubuntu container 18.04
* `/mariadb/Dockerfile`  - to Install and configuring Mariadb Mediawiki database.

These docker images are currectly availble in DockerHUB. 

```bash
docker pull akibahmed/mariadb:latest
docker pull akibahmed/mediawiki:latest
```

## Deploy the stack on kubernetes cluster- 
This project is tested on microK8s local kubernetes cluster. 

clone this project and go to the library folder and run the following command on the k8s node. 

```bash
kubectl apply -f db-persistent-volume.yaml
kubectl apply -f db-volume-claim.yaml
kubectl apply -f db-deployment.yaml
kubectl apply -f db-service.yaml
kubectl apply -f mediawiki-deployment.yaml
kubectl apply -f mediawiki-service.yaml

```
MariaDB connections and secrets can be modified using the mariadb Dockerfile

Once the deployed pods are up and running, the app Mediawiki can be accessed using `nodeIP:30010`

Complete the installation and download LocalSettings.php.

After final submission the app will generate LocalSettings.php file which needs to be copied to config folder in this project and also to the mediawiki container/pod at location `/var/www/html/mediawiki/`

You may add this line of code in mediaWiki dockerfile after the first release `ADD config/LocalSettings.php /var/www/html/mediawiki/`

# Helm Chart

Install mediawiki using the Helm chart: 

```bash
helm install mediawiki ./mediawiki-akib-chart
```


