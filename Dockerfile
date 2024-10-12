# Base image
FROM ubuntu:latest

# Set the working directory inside the container
WORKDIR /app

# Install Python and venv (required to create a virtual environment)
RUN apt update && apt install -y python3-pip python3-venv

# Create a virtual environment
RUN python3 -m venv /app/venv

# Copy the requirements file
COPY requirement.txt /app

# Activate the virtual environment and install dependencies
RUN /app/venv/bin/pip install --no-cache-dir -r requirement.txt

# Copy the application code into the container
COPY . .

# Expose the port the Flask application will be listening on
EXPOSE 5000

# Run the Flask application using the virtual environment
CMD ["/app/venv/bin/python", "app.py"]
