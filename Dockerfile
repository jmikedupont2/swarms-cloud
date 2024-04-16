FROM nvidia/cuda:12.1.1-devel-ubuntu22.04 as builder

# Set fixed environment variables
ENV BASE_IMG=nvidia/cuda:12.1.1-devel-ubuntu22.04
ENV DOCKER_BUILDKIT=1
ENV ARTIFACTS_PATH=/app/artifacts
ENV STORAGE_PATH=/app/storage
ENV HF_HUB_ENABLE_HF_TRANSFER=True


# Set the working directory to the root
WORKDIR /

# Install Python 3.10 and other necessary system packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    software-properties-common \
    && add-apt-repository ppa:deadsnakes/ppa \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
    python3.10 python3.10-dev python3.10-distutils python3-pip python3.10-venv openmpi-bin libopenmpi-dev \
    && python3.10 -m pip install --no-cache-dir --upgrade pip setuptools wheel

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install Python dependencies from requirements.txt
RUN python3 -m pip install -r requirements.txt

# Adjust the working directory to where your application's code will reside
WORKDIR /swarms-cloud

# Copy the application's entire directory structure into the container
COPY . .

# Expose the port the app runs on
EXPOSE 8000

# Use uvicorn to launch the text_to_video application
CMD ["python3.10", "-m", "uvicorn", "text_to_video:app", "--host", "0.0.0.0", "--port", "8000"]
