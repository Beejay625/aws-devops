# Base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file
COPY requirement.txt /app

# Install the project dependencies
RUN pip install -r requirement.txt

RUN apt-get update && apt-get install -y python3-pip
# Copy the application code into the container
COPY . .

# Expose the port the Flask application will be listening on
EXPOSE 5000

# Set environment variables, if necessary
# ENV MY_ENV_VAR=value

# Run the Flask application
CMD ["python3", "app.py"]
