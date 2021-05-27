################## BASE IMAGE ######################

FROM rpwagner/datascience-notebook-poc

################## METADATA ######################

LABEL base_image="rpwagner/datascience-notebook-poc"
LABEL version="0.1"
LABEL software="batcheffects"
LABEL software.version="0.1.0"
LABEL about.summary="Batch effect correction software packages."
LABEL about.publication=""
LABEL about.tags="Genomics"

USER root

COPY apt-packages.txt /tmp/apt-packages.txt
COPY python-packages.txt /tmp/python-packages.txt
COPY conda-packages.txt /tmp/conda-packages.txt

# Update image, install additional distro packages
RUN apt-get update && xargs apt-get install -y < /tmp/apt-packages.txt

# Install additional Python packages
RUN pip install -r /tmp/python-packages.txt

# Install additional R packages from conda
RUN conda install -y -c conda-forge --file /tmp/conda-packages.txt # Required by umap-learn

# Install additional R packages via Rscript
RUN Rscript -e 'install.packages("devtools", repos = "http://cran.us.r-project.org")'
RUN Rscript -e 'devtools::install_github(repo = "RcppCore/RcppEigen", ref = "6cf9f4f0e7b311c528d8b2023b70b396b2718c69")'
RUN Rscript -e 'devtools::install_github(repo = "spatstat/spatstat", ref = "v1.64-1")'
RUN Rscript -e 'devtools::install_github(repo = "satijalab/seurat", ref = "v4.0.0")'
RUN Rscript -e 'devtools::install_github(repo = "satijalab/seurat-wrappers", ref = "156e3925eec2a9180d76602d09b09a3eafb738e8")'
RUN Rscript -e 'devtools::install_github(repo = "immunogenomics/harmony", ref = "c8f4901ef92d6e9b4e1373c52de3b67ff052db3e")'
RUN Rscript -e 'devtools::install_github(repo = "ChristophH/sctransform", ref = "9a120a036caf5205c9c2fc8312ada8c16f96cfb3")'
RUN Rscript -e 'devtools::install_github(repo = "willtownes/glmpca", ref = "v0.2.0")'
RUN Rscript -e 'devtools::install_github(repo = "welch-lab/liger", ref = "v0.5.0")'
RUN Rscript -e 'devtools::install_github(repo = "mlampros/ClusterR", ref = "424febaa587409fc554fb49c9d8dc8edd99d5578")'
RUN Rscript -e 'devtools::install_github(repo = "SaskiaFreytag/schex", ref = "4b7d72d54bdf1812148afba06b43676f994382f6")'
RUN Rscript -e 'devtools::install_github(repo = "powellgenomicslab/Nebulosa", ref = "0.99.92")'
RUN Rscript -e 'install.packages("BiocManager", repos = "http://cran.us.r-project.org*22);BiocManager::install(c( \
  "AnnotationDbi", \
  "RUVnormalize", \
  "scRNAseq", \
  "scater", \
  "sva", \
  "scran", \
  "slingshot", \
  "MAST", \
  "gam", \
  "limma", \
  "clusterExperiment", \
  "ggplot2", \
  "ComplexHeatmap", \
  "RColorBrewer", \
  "cowplot", \
  "umap", \
  "dplyr", \
  "batchelor"))'
RUN Rscript -e 'devtools::install_github(repo = "cole-trapnell-lab/leidenbase", ref = "0.1.0")'
RUN Rscript -e 'devtools::install_github(repo = "cole-trapnell-lab/monocle3", ref = "0.2.3")' 
RUN Rscript -e 'IRkernel::installspec(name = "batcheffects-0.1.0", displayname = "batcheffects-0.1.0", user = FALSE)'

USER $NB_UID
