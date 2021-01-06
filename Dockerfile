FROM jupyter/r-notebook

RUN R -e 'remotes::install_github("satijalab/seurat", ref = "release/4.0.0")'
RUN R -e 'remotes::install_github("jlmelville/uwot")'
