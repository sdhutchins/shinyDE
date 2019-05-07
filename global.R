required_cran_packages <- c(
  "shiny",
  "shinyjs",
  "shinyBS",
  "shinythemes",
  "reshape2",
  "extrafont",
  "tidyverse",
  "PoissonSeq",
  "gridExtra",
  "pracma",
  "pheatmap",
  "samr",
  "stringr",
  "gplots",
  "cli"
  # "rJava"
)

required_bioconductor_packages <- c(
  "DESeq2",
  "edgeR",
  "BiocParallel",
  "org.Hs.eg.db",
  "topGO",
  "ggtree",
  "Rgraphviz",
  "vsn",
  "DESeq",
  "preprocessCore",
  "limma",
  "DEGseq",
  "baySeq",
  "EBSeq",
  "impute"
  # "RDAVIDWebService"
)

cran_packages_to_install <- required_cran_packages[!(required_cran_packages %in% installed.packages()[, 1])]

bioconductor_packages_to_install <- required_bioconductor_packages[!(required_bioconductor_packages %in% installed.packages()[, 1])]

if (length(cran_packages_to_install) > 0) {
  install.packages(cran_packages_to_install, repos = "https://cran.rstudio.com")
}

if (length(bioconductor_packages_to_install) > 0) {
  source("https://bioconductor.org/biocLite.R")
  biocLite()
  biocLite(bioconductor_packages_to_install)
}

# Run the app
shiny::runApp('app')
