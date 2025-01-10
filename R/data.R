#' Gene expression profile of TCGA-COAD and TCGA-READ.
#'
#' A dataset containing the pre-processed mRNA exoression profile of 315 TCGA colorectal samples.
#'
#' @format A microRNA exoression profile with 951 mRNAs and 315 samples.
"mRNAscaled"


#' microRNA exoression profile of TCGA-COAD and TCGA-READ.
#'
#' A dataset containing the pre-processed microRNA exoression profile of 315 TCGA colorectal samples.
#'
#' @format A microRNA exoression profile with 196 microRNAs and 315 samples.
"miRNAscaled"


#' DNA methylation profile of TCGA-COAD and TCGA-READ.
#'
#' A dataset containing the pre-processed DNA methylation profile of 315 TCGA colorectal samples.
#'
#' @format A DNA methylation profile with 358 gene symbols and 315 samples.
"methyscaled"



#' Projection matrixs derived from 315 piared mRNA expression, microRNA expression, and DNA methylation data from TCGA-COAD and TCGA-READ samples.
#'
#' A list containing projection matrixs of each omics. In the list, under ws, the three elements correspond to the projection matrices for mRNA, miRNA, and methylation.
#'
#' @format A list derived from sparse mCCA using PMA::MultiCCA()
"projection_mxs"


#' Example Expression Data
#'
#' A dataset containing example expression data for testing.
#'
#' @format A data frame with z-score scaled values, samples in columns, genes in rows, rownames corresponding to gene symbols.
#' @source \url{https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE39582}
"GSE39582_expr"

