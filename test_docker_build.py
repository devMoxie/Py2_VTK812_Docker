# coding=utf-8

import sys
import vtk
import numpy.version
import scipy


if __name__ == '__main__':
    print("Python Verison: ", sys.version)
    print(vtk.vtkVersion.GetVTKSourceVersion())
    print("NumPy Version: ", numpy.version.version)
    print("SciPy Version: ", scipy.__version__)
