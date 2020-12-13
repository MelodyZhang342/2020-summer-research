FROM jupyter/r-notebook
WORKDIR $HOME 

ARG NB_USER="jovyan"
ARG NB_UID="1000"

USER root
RUN fix-permissions /etc/jupyter/
RUN apt-get update && apt-get -y update
RUN apt-get install -y \
        libcgal-dev\
        libglu1-mesa-dev \
        mesa-common-dev \
        freeglut3-dev


# sudo apt-get install xorg 
# sudo apt-get install libx11-dev 
# sudo apt-get install libglu1-mesa-dev 

#libglu1-mesa-dev libglu1-mesa-dev
# Switch back to jovyan to avoid accidental container runs as root
USER $NB_UID

# Install Packages 
RUN conda install r-tidyverse
RUN conda install r-plotly
RUN conda install r r-rgl

# These packages are not available in conda
RUN R -e "install.packages('rayshader')"

# #https://anaconda.org/conda-forge/r-rgdal
RUN conda install -c conda-forge r-rgdal

# # https://anaconda.org/conda-forge/r-sf
# RUN conda install -c conda-forge r-sf 

# # https://anaconda.org/conda-forge/r-raster
# RUN conda install -c conda-forge r-raster

# # https://anaconda.org/conda-forge/r-geojsonio
# RUN conda install -c conda-forge r-geojsonio
