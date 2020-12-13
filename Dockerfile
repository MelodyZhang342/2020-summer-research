FROM jupyter/r-notebook
WORKDIR $HOME 

# Install Packages 
RUN conda install r-tidyverse
RUN conda install r-plotly


# # https://anaconda.org/conda-forge/r-sf
# RUN conda install -c conda-forge r-sf 

# # https://anaconda.org/conda-forge/r-raster
# RUN conda install -c conda-forge r-raster

# # https://anaconda.org/conda-forge/r-geojsonio
# RUN conda install -c conda-forge r-geojsonio
