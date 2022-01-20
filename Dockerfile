FROM ubuntu:20.04
RUN apt update
RUN apt-get install software-properties-common -y
RUN add-apt-repository universe
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.7-venv -y
RUN python3.7 -m ensurepip
RUN python3.7 -m pip install --upgrade pip
RUN apt install python3.7-dev libffi-dev g++ -y
RUN apt-get install make makepp gcc gfortran python-dev libopenblas-dev liblapack-dev cython -y
RUN python3.7 -m pip install setuptools
RUN python3.7 -m pip install numpy==1.19.1 scipy==1.5.2 matplotlib==3.3.1 jupyter==1.0.0
CMD ["jupyter-notebook","--port=8888", "--no-browser", "--ip=0.0.0.0", "--allow-root"]
STOPSIGNAL SIGQUIT
