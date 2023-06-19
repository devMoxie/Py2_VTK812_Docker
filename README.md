# Python 2.7.18 + VTK 8.1.2

The purpose of this project is to create a Docker image with the below requirements to which a source code 
directory can be bind-mounted. 

* Python 2.7.18
* vtk 8.1.2
* appnope==0.1.0
* decorator==4.0.2
* gnureadline==6.3.3
* ipdb==0.8.1
* ipython==4.0.0
* ipython-genutils==0.1.0
* nine==0.3.4
* numpy==1.9.2
* numpy-stl==1.5.0
* path.py==8.1.1
* pexpect==3.3
* pickleshare==0.5
* Pillow==2.8.2
* python-utils==1.6.2
* simplegeneric==0.8.1
* traitlets==4.0.0
* wheel==0.24.0
* scipy==0.15.1

### Installing Dependencies

On Mac OS Ventura with python 2.7.18 installed, I was able to `pip install vtk==8.1.2`.
However, with Docker using the base python 2.7.18 image, vtk needed to be built from source.
See Dockerfile for more info. If installing vtk on Mac OS, add vtk to requirements.txt.

To test local installation of dependencies run `python test_docker_build.py`

### Docker

Docker Hub Repository: [https://hub.docker.com/r/devmoxie/py2.vtk8.1.2](https://hub.docker.com/r/devmoxie/py2.vtk8.1.2)

Get image: `docker pull devmoxie/py2.vtk8.1.2:1.0`

Test image: `docker run devmoxie/py2.vtk8.1.2:1.0`

Output:

`('Python Verison: ', '2.7.18 (default, Apr 21 2020, 09:53:40) \n[GCC 8.3.0]')`<br>
`vtk version 8.1.2`<br>
`('NumPy Version: ', '1.9.2')`<br>
`('SciPy Version: ', '0.15.1')`<br>
