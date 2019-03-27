FROM gcc

ENV PYTHONUNBUFFERED 1is

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

RUN apt-get update && apt-get install -y libmcrypt-dev

# RUN apt get install mcrypt-1.0.1 && docker-php-ext-enable mcrypt
# RUN apt-get update && apt-get install php5.6

RUN apt-get update && apt-get install -y \
    php7.0-mcrypt \
    python-pip

RUN pip install Lemmagen
RUN pip install -r requirements.txt

# Make port 80 available to the world outside this container
EXPOSE 80

# Define environment variable
#ENV NAME World

# Run app.py when the container launches
#CMD ["python", "app.py"]

RUN pip install django_debug_toolbar

RUN python manage.py migrate

RUN python manage.py runserver 80