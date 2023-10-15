# Use the ML-environment as a parent image
FROM jhoeller/computer-vision:latest

# Install other dependencies
RUN apt-key del 7fa2af80 \
    && rm /etc/apt/sources.list.d/nvidia-ml.list /etc/apt/sources.list.d/cuda.list
RUN wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-keyring_1.0-1_all.deb \
    && dpkg -i cuda-keyring_1.0-1_all.deb
RUN apt-get update
RUN apt-get install ffmpeg -y

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 8888 available to the world outside this container
EXPOSE 8887

# Define environment variable
ENV NAME Eye-Test
