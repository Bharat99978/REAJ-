# Base image
FROM jupyter/base-notebook:python-3.9

# Switch to root to configure the system
USER root

# Set the root password
RUN echo "root:13792588" | chpasswd

# Ensure Jupyter Lab runs as root
ENV NB_USER="root" NB_UID="0" NB_GID="0"
ENV HOME="/root"

# Copy requirements.txt into the container
COPY requirements.txt /tmp/requirements.txt

# Install Python libraries from requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Expose the Jupyter Lab port
EXPOSE 8888

# Start Jupyter Lab as root
CMD ["jupyter-lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
