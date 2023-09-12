# FROM: Specifies the base image to use for the new image. 
# In this case, it's a Python 3 image as the starting point for building your image.
FROM python:3


# Copies the requirement.txt from the source directory to image root directory
COPY requirement.txt .

# Installs the required dependencies and libraries
RUN pip install -r requirement.txt

# Copt the src in image root directory
COPY . .

# run command to apply database migration
RUN python manage.py migrate

# EXPOSE: Informs Docker that the container listens on port 8000. 
# This doesn't actually publish the port, 
# but serves as reference for those who may want to expose it later.
EXPOSE 8000


# CMD: Specifies the command that will be executed when a container is run based on the image. 
# In this case, it's starting the Django development server on 0.0.0.0:8000.
CMD ["python","manage.py","runserver","0.0.0.0:8000"]