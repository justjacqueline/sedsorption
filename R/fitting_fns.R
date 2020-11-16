#' @title Runs the model and calculates the cost
#'
#' @description Runs the model and calculates the cost
#' @param p
#' @param dat
#' @param times_out
#' @param model
#' @param initial
#' @return The model cost
#' @export
#' @examples #
#'
cost <- function(p, dat, times_out, model, initial) {
  out <- ode(initial, times_out, model, p, method = "bdf")
 #  out <- ode(initial, times_out, model, p)
  modCost(out, dat, weight = "none")} # try weight = "std" or "mean"
