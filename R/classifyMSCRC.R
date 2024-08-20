#' classify multi-omics subtypes for colorectal cancer (MSCRC).
#' This function classify MSCRC for colorectal cancer samples, based on any combination of mRNA expression, microRNA expression, and DNA methylation data.
#'
#' @param exp a data frame with samples in rows and multi-omics features in columns. The column names of exp should be X1, X2, ..., X196.
#' @return A list label: a vector indicating the predicted subtype for each sample. prob: A data frame where each row represents a sample and each column represents the predicted probability for each subtype. multi-omics subtypes for colorectal cancer (MSCRC)
#' @export
#' @import caret naivebayes stats
#' @importFrom stats predict
#' @examples
#' result = classifyMSCRC(example_exp)
#' label = result$label
#' prob = result$probs
#'
#'


classifyMSCRC <-function(exp) {
  model = load_model()
  probs <- predict(model, newdata = as.data.frame(exp), type = "prob")
  label <- as.factor(apply(probs, 1, function(t) colnames(probs)[which.max(t)]) )
  names(label) <- rownames(exp)
  result <- list(label=label, prob=probs)
  return(result)
}
