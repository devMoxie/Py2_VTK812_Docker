FROM python:2.7.18

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    libxt-dev \
    libgl1-mesa-dev \
    libexpat1-dev \
    libpython2.7-dev \
    zlib1g-dev \
    libblas-dev \
    liblapack-dev \
    wget \
    gfortran \
    tar

WORKDIR /Py2_VTK812_Docker

# Download and extract VTK source code
RUN wget https://github.com/Kitware/VTK/archive/v8.1.2.tar.gz && \
    tar -xzvf v8.1.2.tar.gz && \
    rm v8.1.2.tar.gz

# Build VTK from source
WORKDIR /Py2_VTK812_Docker/VTK-8.1.2/build
RUN cmake -DVTK_WRAP_PYTHON=ON -DPYTHON_EXECUTABLE=/usr/local/bin/python \
    -DBUILD_TESTING=OFF \
    ../ && \
    make && \
    make install

# Install VTK Python package
WORKDIR /Py2_VTK812_Docker/VTK-8.1.2/build/Wrapping/Python
RUN make && \
    make install

WORKDIR /Py2_VTK812_Docker

# Set the necessary environment variables
ENV LD_LIBRARY_PATH="/usr/local/lib:/python2_docker_test/VTK-8.1.2/build/lib:${LD_LIBRARY_PATH}"
ENV PYTHONPATH="/usr/local/lib/python2.7/site-packages:${PYTHONPATH}"

RUN python -m pip install --upgrade pip

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .

CMD ["python", "./test_docker_build.py"]
