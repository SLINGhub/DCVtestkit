% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/outputdata-excel.R
\name{write_summary_excel}
\alias{write_summary_excel}
\title{Write Curve Summary To Excel}
\usage{
write_summary_excel(
  curve_summary,
  file_name,
  sheet_name = "Curve Summary",
  corrcoef_column = "r_corr",
  corrcoef_min_threshold = 0.8,
  pra_column = "pra_linear",
  pra_min_threshold = 80,
  mandel_p_val_column = "mandel_p_val",
  mandel_p_val_threshold = 0.05,
  workflow1_column = "wf1_group",
  workflow2_column = "wf2_group",
  pass_criteria_words = c("Good Linearity"),
  testing = FALSE
)
}
\arguments{
\item{curve_summary}{The summary table generated
by function \code{\link[=summarise_curve_table]{summarise_curve_table()}} and/or \code{\link[=evaluate_linearity]{evaluate_linearity()}}}

\item{file_name}{Name of the excel file}

\item{sheet_name}{Sheet name to output the results
in Excel, Default: 'Curve Summary'}

\item{corrcoef_column}{A column in \code{curve_summary} that holds the
correlation coefficient, Default: 'r_corr'}

\item{corrcoef_min_threshold}{The minimum threshold value of the curve's
correlation coefficient to pass being potentially linear.
A pass will colour the excel cell green and red otherwise.
Equality to the threshold is considered a pass, Default: 0.8}

\item{pra_column}{A column in \code{curve_summary} that holds the
percent residual accuracy, Default: 'pra_linear'}

\item{pra_min_threshold}{The minimum threshold value of the curve's
percent residual accuracy to pass being potentially linear.
A pass will colour the excel cell green and red otherwise.
Equality to the threshold is considered a pass, Default: 80}

\item{mandel_p_val_column}{A column in \code{curve_summary} that holds the
p value results for the Mandel's fitting test.
Default: 'mandel_p_val'}

\item{mandel_p_val_threshold}{The threshold value of the curve's
p value for the Mandel's fitting test to reject the hypothesis that
the quadratic model fits better than the linear model.
If the value is less than this value, the cell colour will be red.
Cell colour will be green if the p value is equal or over the threshold.
Default: 0.05}

\item{workflow1_column}{A column in \code{curve_summary} that holds the
evaluation results of workflow 1, Default: 'wf1_group'}

\item{workflow2_column}{A column in \code{curve_summary} that holds the
evaluation results of workflow 2, Default: 'wf2_group'}

\item{pass_criteria_words}{A character vector to indicate which words in
\code{workflow1_column} or \code{workflow2_column} would have its excel cell coloured
green and the rest to red.
Default: c("Good Linearity")}

\item{testing}{To indicate if we are running a test,
if so, no excel file is given out}
}
\description{
Write curve summary table to an excel sheet
}
\examples{
curve_name <- c(
  "Curve_1", "Curve_1", "Curve_1", "Curve_1",
  "Curve_2", "Curve_2", "Curve_2", "Curve_2"
)

curve_batch_name <- c(
  "B1", "B1", "B1", "B1",
  "B2", "B2", "B2", "B2"
)

wf1_group <- c(
  "Poor Linearity", "Good Linearity",
  "Poor Linearity", "Poor Linearity",
  "Poor Linearity", "Good Linearity",
  "Poor Linearity", "Poor Linearity"
)

wf2_group <- c(
  "Saturation Regime", "Good Linearity",
  "Noise Regime", "Poor Linearity",
  "Saturation Regime", "Good Linearity",
  "Noise Regime", "Poor Linearity"
)

r_corr <- c(
  0.951956, 0.948683, 0.978057, 0.976462,
  0.970618, 0.969348, 0.343838, 0.383552
)

pra_linear <- c(
  65.78711, 64.58687, 90.21257, 89.95473,
  72.91220, 72.36528, -233.05949, -172.13659
)

mandel_p_val <- c(
  2.899006e-07, 7.922290e-07, 2.903365e-01, 3.082930e-01,
  3.195779e-08, 6.366588e-08, 3.634004e-02, 1.864090e-02
)

concavity <- c(
  -4133.501328, -4146.745747, -3.350942, -3.393617,
  0.3942824, 0.4012963, -19.9469621, -22.6144875
)

curve_summary <- data.frame(
  Curve_Name = curve_name,
  Curve_Batch_Name = curve_batch_name,
  wf1_group = wf1_group, wf2_group = wf2_group,
  r_corr = r_corr, pra_linear = pra_linear,
  mandel_p_val = mandel_p_val,
  concavity = concavity
)

# Create an excel report, set testing = FALSE to output results
write_summary_excel(curve_summary,
  file_name = "curve_summary.xlsx",
  testing = TRUE
)

}
