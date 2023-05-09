## This is a dockerized web app

1. Create an EC2 Ubuntu VM, and install docker using the apt repo.

```
Setup the apt repo:
{
    sudo apt-get update
    sudo apt-get install ca-certificates curl gnupg
    sudo install -m 0755 -d /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
    sudo chmod a+r /etc/apt/keyrings/docker.gpg
    echo \
        "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
        "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
}

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
sudo docker run hello-world
```

3. Add ubuntu user into docker group
```
sudo vim /etc/group
sudo usermod -aG docker ubuntu
```

2. Choose a demo site from tooplate.com

3. Unzip the file
* Note: We can't put a zip file in the dockerfile. It won't be extracted but we can have it in archive(tar format)
```
wget https://www.tooplate.com/zip-templates/2133_mosso_interior.zip
unzip 2133_mosso_interior.zip
tar cvzf interior.zip
```

4. Write a Dockerfile

5. Run docker build command
```
docker build -t interiorimg .(if dockerfile is in the current working directory)
```

* Note: Always make your docker build uninteractive using environment variables 
```
ENV DEBIAN_FRONTEND=noninteractive
```

6. Pull the image and create a container
```
docker run -d --name interiorwebsite -p 9080:80 {image name}
```

7. Validate the container on the browser `http://{Ubuntu-IP-Address}:9080/`

8. Push the image to docker hub registry
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
