# **MSCRCclassifier**: an R package for multi-omics subtyping of colorectal cancer

The `MSCRCclassifier` package provides multi-omics subtyping for colorectal cancer. It accepts any combination of mRNA expression, microRNA expression, and DNA methylation data as input. The training data of the classifier is integrated from the three omics data based on [sparse mCCA](https://www.degruyter.com/document/doi/10.2202/1544-6115.1470/html). 
See [accompagnying vignette](https://github.com/Carpentierbio/MSCRCclassifier/blob/main/docs/MSCRCclassifier.html) for further details.
See [accompagnying vignette](https://Carpentierbio.github.io/MSCRCclassifier/MSCRCclassifier.html![image](https://github.com/user-attachments/assets/dff83158-1956-4506-9c26-eb9154c09ea6)
) for further details.


## Set up

The `MSCRCclassifier` package requires R (>= 2.10), and depends on the R packages "caret" and "naivebayes".
Use the following command in R to install the `MSCRCclassifier` package:
```
library(devtools)
install_github("Carpentierbio/MSCRCclassifier") # install the "MSCRCclassifier" package
```

## Quick start
The detailed multi-omics integration and pre-processing steps can be refered to here referred to here: [https://github.com/Carpentierbio/MSCRC](https://github.com/Carpentierbio/MSCRC).
```
library(caret)
library(naivebayes)
library(MSCRCclassifier)

## MSCRC prediction of primary colorectal cancer samples
data("GSE39582_expr")
data("projection_mxs")
dim(projection_mxs$ws[[1]])
mRNAexprCCA <- t(GSE39582_expr) %*% projection_mxs$ws[[1]]
mRNAexprCCA <- scale(mRNAexprCCA)
mRNAexprCCA[1:5,1:5]
a1<-0.4
data_input <- scale(a1*mRNAexprCCA)
colnames(data_input) <- paste("X",1:ncol(projection_mxs$ws[[1]]), sep = "")
data_input[1:5,1:5]
result <- classifyMSCRC(data_input)
label <- result$label
prob <- result$probs
```

## Design

Package was developed in _[RStudio](https://www.rstudio.com/)_ following guidelines in [R packages](http://r-pkgs.had.co.nz/).
