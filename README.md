# Simple Django Todo Application 

## Install Locally 

1. Clone the Repo 
```sh
git clone https://github.com/i-dipanshu/python-django-todo-app
```

2. Install Python and pip for our operating system & confirm the Installation 
```sh
python --version 
pip --version
```

3. Install the dependencies of the application 
```sh
pip install -r requirement.txt
```
4. Confirm the Django installation 
```sh 
python -m django --version
```
5. Migrate the database
```sh
python manage.py migrate 
```

6. Start the development server
```sh
python manage.py runserver 
```
7. Now the application is accessible on port 8000 
```sh
http://localhost:8000
```

## Spin this application in a docker container 

1. Install Docker and verify the installation 
```sh 
docker --version
```

2. We may use the below command to spin up the container using the image created by me 
```sh
docker run -dp 8000:8000 dipanshu13/django-todo:v1
```
Now the application is accessible at `http://localhost:8000`

3. Optionally, We may create our image for this application and use it to spin application. It uses the Dockerfile present in the root of the repository. [Refer](./Dockerfile) to understand each layer.
```sh
docker build -t <image-name>:<tag> .
```
4. Spin the container 
```sh
docker run -d -p 8000:8000 <image-name>
```

## Pushing the image to DockerHub

1. **Tag the Image:**
Before pushing the image, We need to tag it with our Docker Hub username/repo. Replace `username` with our Docker Hub username and `image-name` with the name We want for our repository on Docker Hub.

```sh
docker tag local-image:tag username/image-name:tag
```

1. **Login to Docker Hub:**
Before We can push an image to Docker Hub, We need to log in using the `docker login` command.

```sh
docker login
```

We'll be prompted to enter our Docker Hub username and password.

3. **Push the Image:**
Once We're logged in, We can push the tagged image to Docker Hub.

```sh
docker push username/image-name:tag
```

4. **Check on Docker Hub:**
After pushing, We can log in to our Docker Hub account through the web interface to see the pushed image in our repository.

Remember that Docker Hub repositories are public by default, so be cautious about pushing sensitive information. If We need private repositories, Docker Hub offers private repository options for paid accounts.

Also, make sure that our Docker image is properly configured and secured before pushing it to a public repository.