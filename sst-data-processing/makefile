CXX=gcc
CXXFLAGS=-march=skylake-avx512 -fopenmp -std=c++11 -lstdc++
OPTRPT=#-qopt-report

default : sst-dp

sst-dp : main.cc
	${CXX} ${OPTRPT} ${CXXFLAGS} -o "$@" "$<"
