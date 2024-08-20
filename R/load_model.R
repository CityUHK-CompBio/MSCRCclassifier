#' load model
#' This function load model for subtype prediction.
#'
#' @return A model.
#' @export
#' @import caret


load_model <- function() {
  model_path <- system.file("model.rds", package = "MSCRCclassifier")
  readRDS(model_path)
}
