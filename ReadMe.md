# **MSCRCclassifier**: an R package for multi-omics subtyping of colorectal cancer samples

The `MSCRCclassifier` package provides multi-omics subtyping for colorectal cancer samples. It accepts any combination of mRNA expression, microRNA expression, and DNA methylation data as input. The training data of the classifier is integrated from the three omics data based on [sparse mCCA](https://www.degruyter.com/document/doi/10.2202/1544-6115.1470/html).


## Set up

The `MSCRCclassifier` package requires R (>= 2.10), and depends on the R packages "caret" and "naivebayes".
Use the following command in R to install the `MSCRCclassifier` package:
```
library(devtools)
install_github("Carpentierbio/MSCRCclassifier") # install the "MSCRCclassifier" package
```

## Quick start
```
library(caret)
library(naivebayes)
library(MSCRCclassifier)

## MSCRC prediction of primary colorectal cancer samples
result = classifyMSCRC(example_exp)
label = result$label
prob = result$probs
```

## Design

Package was developed in _[RStudio](https://www.rstudio.com/)_ following guidelines in [R packages](http://r-pkgs.had.co.nz/) [Wickham 2015].
