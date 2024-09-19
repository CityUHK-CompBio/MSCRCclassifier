#' classify multi-omics subtypes for colorectal cancer (MSCRC).
#' This function classifies MSCRC for colorectal cancer, based on any combination of mRNA expression, microRNA expression, and DNA methylation data.
#'
#' @param exp expression matrix with samples in rows and multi-omics features in columns. The column names of exp should be X1, X2, ..., X196.
#' @return A list label: a vector indicating the predicted subtype for each sample. prob: A data frame where each row represents a sample and each column represents the predicted probability for each subtype. multi-omics subtypes for colorectal cancer (MSCRC)
#' @export
#' @import caret naivebayes stats
#' @importFrom stats predict
#' @examples
#' data("GSE39582_expr")
#' data("projection_mxs")
#' dim(projection_mxs$ws[[1]])
#' mRNAexprCCA = t(GSE39582_expr) %*% projection_mxs$ws[[1]]
#' mRNAexprCCA = scale(mRNAexprCCA)
#' mRNAexprCCA[1:5,1:5]
#' a1=0.4
#' data_input = scale(a1*mRNAexprCCA)
#' colnames(data_input) = paste("X",1:ncol(projection_mxs$ws[[1]]), sep = "")
#' data_input[1:5,1:5]
#' result = classifyMSCRC(data_input)
#' label = result$label
#' prob = result$probs
#'
#'


classifyMSCRC <-function(exp) {
  model <- load_model()
  probs <- predict(model, newdata = as.data.frame(exp), type = "prob")
  label <- as.factor(apply(probs, 1, function(t) colnames(probs)[which.max(t)]) )
  names(label) <- rownames(exp)
  result <- list(label=label, prob=probs)
  return(result)
}
