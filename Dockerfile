# Base image
FROM jupyter/base-notebook:python-3.9

# Install additional packages if needed
RUN pip install --no-cache-dir \
    numpy \
    pandas \
    matplotlib \
    scikit-learn \
    jupyterlab

# Expose port for Jupyter Lab
EXPOSE 8888

# Start Jupyter Lab
CMD ["jupyter-lab", "--ip=0.0.0.0", "--no-browser", "--allow-root", "--NotebookApp.token=''"]
