FROM jupyter/r-notebook

RUN R -e "install.packages('Seurat', repos = 'https://cran.us.r-project.org')"
