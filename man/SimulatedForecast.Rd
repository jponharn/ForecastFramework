% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/SimulatedForecast

%Two new commands to help with formatting
\newcommand{\methodtable}{\bold{\cr #1 \cr} \tabular{lcl}}
\newcommand{\methoditem}{\emph{#1} \tab-\tab #2\cr}
\newcommand{\methodname}{\subsection{#1}}
\docType{class}
\name{SimulatedForecast}
\alias{SimulatedForecast}
\title{SimulatedForecast}
\description{This class is a forecast where the data is many simulated trials.}
\seealso{
Inherits from : \code{\link{Forecast}}

Is inherited by : \code{\link{IncidenceForecast}}}
\examples{


IncidenceForecast <- R6Class(
  classname = "IncidenceForecast",
  inherit = SimulatedForecast,
  private = list(
    .data = AbstractSimulatedIncidenceMatrix$new()
  ),
  public = list(
    initialize = function(data=SimulatedIncidenceMatrix$new(),forecastTimes=c())\{
      if(data$ncol != length(forecastTimes))\{
        stop("The number of columns should be the number of times forecasted.")
      \}
      private$.forecastMadeTime = now()
      private$.forecastTimes = forecastTimes
      private$.data = data
    \}
  ),
  active = list(
    data = function(value)\{
      private$defaultActive(".data","private",value)
    \}
  )
)

}
\section{Fields}{
\describe{
\item{data}{ The data used to create the forecast.}
\item{forecastMadeTime}{When the forecast was created.}
\item{forecastTimes}{The times the forecast is about.}
\item{model}{The model used to create the forecast.}
\item{nsim}{The number of simulations.}
\item{sample}{Draw a random sample from the possible model predictions.  Please see implementation of the data for the properties of the sampling.}
}}
\section{Methods}{
\methodname{binDist(cutoffs,include.lowest = FALSE,right = TRUE)}{
Get the distribution of simulations of the data within fixed bins.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
\methoditem{cutoffs}{A numeric vector with elements to use as the dividing values for the bins.}
\methoditem{include.lowest}{logical, indicating if an x[i] equal to the lowest (or highest, for right = FALSE) breaks value should be included.}
\methoditem{right}{logical, indicating if the intervals should be closed on the right (and open on the left) or vice versa.}
}}
\item{Value}{an ArrayData.}
}}
\methodname{debug(string)}{
A function for debugging the methods of this class.  It calls the \link{browser} command.  In order for methods to opt into to debugging, they need to implement the following code at the beginning: if(<method_name> \%in\% private$.debug)\{browser()\}.  This method exists, because the debugger is not always intuitive when it comes to debugging R6 methods.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
\methoditem{string}{The name(s) of methods to debug as a character vector}
}}}}
\methodname{initialize(...)}{
This function \bold{should} be extended. Create a new instance of this class.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
\methoditem{\dots}{This function should take in any arguments just in case.}
}}}}
\methodname{mean()}{
This method extracts the elementwise mean of the forecast.  This function will not change the number of rows or columns in the data, but will convert probabilistic estimates into deterministic ones.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
}}}}
\methodname{median()}{
This method extracts the elementwise median of the forecast.  This function will not change the number of rows or columns in the data, but will convert probabilistic estimates into deterministic ones.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
}}
\item{Value}{a MatrixData.}
}}
\methodname{quantile(alphas,na.rm=FALSE)}{
Get the cutoffs for each percentile in alphas.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
\methoditem{alphas}{A numeric vector with elements between \code{0} and \code{1} of percentiles to find cutoffs for.}
\methoditem{na.rm}{A boolean regarding whether to remove NA values before computing the quantiles.}
}}
\item{Value}{an ArrayData.}
}}
\methodname{undebug(string)}{
A function for ceasing to debug methods.  Normally a method will call the \link{browser} command every time it is run.  This command will stop it from doing so.
\describe{\item{\emph{Arguments}}{\tabular{lcl}{
\methoditem{string}{The name(s) of the methods to stop debugging.}
}}}}
}
