#!/bin/bash
#Script to clean repair/install python


# Set the username and Python version to install
USERNAME=david
PYTHON_VERSION=3.11.3

# Uninstall the system Python
#sudo apt-get purge -y python*

# Install dependencies for building Python from source
sudo nala update
sudo nala install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget

# Download and extract Python source code
cd /tmp
wget https://www.python.org/ftp/python/$PYTHON_VERSION/Python-$PYTHON_VERSION.tgz
tar -xf Python-$PYTHON_VERSION.tgz

# Build and install Python
cd Python-$PYTHON_VERSION
./configure --enable-optimizations --enable-shared --prefix=/usr/local
make -j 4
sudo make altinstall

# Set up virtual environment and activate it
sudo nala install -y python3-venv
python3 -m venv /home/$USERNAME/env
source /home/$USERNAME/env/bin/activate

# Upgrade pip and install commonly used packages
pip install --upgrade pip

# Deactivate virtual environment
deactivate

echo "Python installation complete."

