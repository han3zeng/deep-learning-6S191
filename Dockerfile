# Debian/Ubuntu-based image
# The setuptools<81 and python:3.11-slim are specifically for mitdeeplearning which depends on pkg_resources
FROM python:3.11-slim

# This is for lab 2 specifically
RUN apt-get update && apt-get install -y libgl1

# This is for lab 1
RUN apt-get update && apt-get install -y \
    abcmidi \
    timidity 

RUN apt-get update && apt-get install -y \
    graphviz \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Create non‑root user "app" with home dir
RUN useradd -m -u 1000 -s /bin/bash app

# Workdir and permissions
WORKDIR /usr/local/app
RUN mkdir -p /usr/local/app/src && chown -R app:app /usr/local/app


# Install deps as root (readable to all users)
RUN python -m pip install --upgrade pip wheel && \
    python -m pip install "setuptools<81"
RUN pip install --no-cache-dir --no-build-isolation mitdeeplearning==0.7.5
COPY requirements.txt ./
# comet-ml tqdm are fro lab1
RUN pip install --no-cache-dir -r requirements.txt \
    && pip install --no-cache-dir jupyterlab comet-ml tqdm
# For lab2
RUN pip install --no-cache-dir opencv-python==4.13.0.92 \
     &&  pip install opencv-python-headless==4.13.0.92

# Drop privileges
USER app
ENV HOME=/home/app

# Default port for jupyter lab
EXPOSE 8888
VOLUME ["/usr/local/app/src"]
USER app
CMD ["jupyter", "lab", "--notebook-dir=./src", "--no-browser", "--ServerApp.ip=0.0.0.0"]
