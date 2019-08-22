ARG BASE_CONTAINER=jupyter/datascience-notebook:2ce7c06a61a1
FROM $BASE_CONTAINER

LABEL maintainer="Ravi Kishore <rkishore@voziq.com>"

USER root

RUN apt-get update && 
apt-get install --yes git

USER $NB_USER

RUN pip install nbgitpuller && 
jupyter serverextension enable --py nbgitpuller --sys-prefix && 
jupyter labextension install @jupyterlab/git && 
pip install jupyterlab-git && 
jupyter serverextension enable --py jupyterlab_git --sys-prefix

ENV NBGITPULLER_APP lab