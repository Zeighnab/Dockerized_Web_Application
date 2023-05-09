## This is a dockerized web app

1. Create an EC2 Ubuntu VM, and install docker using the apt repo (https://docs.docker.com/engine/install/ubuntu/)

2. Add ubuntu user into docker group
```
sudo vim /etc/group
sudo usermod -aG docker ubuntu
```

3. Choose a demo site from tooplate.com

4. Unzip the file
* Note: We can't put a zip file in the dockerfile. It won't be extracted but we can have it in archive(tar format)
```
wget https://www.tooplate.com/zip-templates/2133_mosso_interior.zip
unzip 2133_mosso_interior.zip
tar cvzf interior.zip
```

5. Write a Dockerfile

6. Run docker build command
```
docker build -t interiorimg . (if dockerfile is in the current working directory)
```

* Note: Always make your docker build uninteractive using environment variables 
```
ENV DEBIAN_FRONTEND=noninteractive
```

7. Pull the image and create a container
```
docker run -d --name interiorwebsite -p 9080:80 {image name}
```

8. Validate the container on the browser `http://{Ubuntu-IP-Address}:9080/`

9. Push the image to docker hub registry
* Note: To push into any registry, the image name should be `account-name/image-name`. You rebuild the image or change the tag.
```
docker tag {image-name} {account-name/image-name}
```

* Login into your account on docker hub
```
docker login
```

* Push into your registry
```
docker push {account-name/image-name}
```
