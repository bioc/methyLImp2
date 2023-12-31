% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/evaluatePerformance.R
\name{evaluatePerformance}
\alias{evaluatePerformance}
\title{Evaluate root mean square error (RMSE) and mean absolute error (MAE)}
\usage{
evaluatePerformance(beta_true, beta_imputed, na_positions)
}
\arguments{
\item{beta_true}{first numeric data matrix.}

\item{beta_imputed}{second numeric data matrix}

\item{na_positions}{a list where each element is a list of two elements: 
column id and ids of rows with NAs in that column. 
We need this because some NAs in the dataset are from real data and 
not artificial, so we can't evaluate the performance of the method 
on them since we do not know real value. 
Therefore, we need to know the positions of artificial NAs.}
}
\value{
A numerical vector of two numbers, root mean square error 
and mean absolute error.
}
\description{
This function computes root mean square error and mean absolute error as 
an element-wise difference between two matrices (apart from NA elements): 
\eqn{RMSE = \sqrt{\sum_i (true_i - est_i)^2 / \#NAs)}}, 
\eqn{MAE = \sum_i |true_i - est_i| / \#NAs}.
}
\examples{
{
data(beta)
with_missing_data <- generateMissingData(beta, lambda = 3.5)
beta_with_nas <- with_missing_data$beta_with_nas
na_positions <- with_missing_data$na_positions
beta_imputed <- methyLImp2(input = beta_with_nas, type = "EPIC", 
                          minibatch_frac = 0.5, ncores = 1)
evaluatePerformance(beta, beta_imputed, na_positions)
}
}
