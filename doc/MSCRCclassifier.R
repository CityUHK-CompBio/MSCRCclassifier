## ----include = FALSE----------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE, warning=FALSE, results='hide'-----------------------------
options(repos = c(CRAN = "https://cloud.r-project.org/"))
install.packages(c("caret", "naivebayes"))
library(caret)
library(naivebayes)
library(devtools)
# install the "MSCRCclassifier" package
# install_github("Carpentierbio/MSCRCclassifier")

## ----eval=TRUE----------------------------------------------------------------
library(MSCRCclassifier)
library(dplyr)
# Load example mRNA expression profile
data("GSE39582_expr")
# Load projection matrixs derived from 315 TCGA-COAD and TCGA-READ samples
data("projection_mxs")
dim(projection_mxs$ws[[1]])  
# Projecting each omics data into unified space
mRNAexprCCA = t(GSE39582_expr) %*% projection_mxs$ws[[1]]
mRNAexprCCA = scale(mRNAexprCCA)
mRNAexprCCA[1:5,1:5] # samples in rows and genes in columns 算出来是行样本列基因
  
a1=0.4
data_input = scale(a1*mRNAexprCCA)
colnames(data_input) = paste("X",1:ncol(projection_mxs$ws[[1]]), sep = "")
data_input[1:5,1:5]

## ----eval=TRUE, message=TRUE--------------------------------------------------

# MSCRC prediction of primary colorectal cancer
result <- classifyMSCRC(data_input)
label <- result$label
prob <- result$prob %>%
  `colnames<-`(paste("MSCRC", 1:5, "_prob", sep = ""))
res = data.frame(prob, subtype = paste("MSCRC", label, sep = "") ) %>%
  `rownames<-`(names(label))
head(res)

## ----echo=FALSE---------------------------------------------------------------
  sessionInfo()

