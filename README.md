# Simple Django Todo Application 

## Install Locally 

1. Clone the Repo 
```sh
git clone https://github.com/i-dipanshu/python-django-todo-app
```

2. Install Python and pip for your operating system & confirm the Installation 
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

2. You may use this command to spin up the container using the image created by me 
```sh

```

3. Optionally, We may create our image for this application and use it to spin application. It uses the Dockerfile present in the root of the repository. [Refer](./Dockerfile) to understand each layer.
```sh
docker built -t <image-name> .
```
4. Spin the container 
```sh
docker run -d -p 8000:8000 <image-name>
```
