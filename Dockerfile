FROM jupyter/r-notebook

RUN R -e "install.packages('Seurat')"
