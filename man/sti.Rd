\name{sti}

\alias{sti}

\title{Compute standardized temperature indices}

\description{
\code{sti} returns a time series of standardized temperature indices (STI).
}

\usage{
sti(values, scale)
}

\arguments{
  \item{values}{ a time ordered vector of temperature values.}
  \item{scale}{ an integer representing the time scale at which the STI will be computed.}
}

\details{
The \code{sti} function allows computing the STI.

In essence, the function standardizes a variable following a normal distribution function (which is assumed to be the case for temperature values given as input to the function). It is designed to be used with monthly values.

STI values can be computed on different time scales given in number of months to the function. Typical values are 1, 3, 6, 12, 24 or 48 for monthly, seasonal, annual or interannual calculation.

In practice, computation of the STI is made first by averaging temperature values over the time scale specified for each month of the time series. For example, on a time series of 1,200 consecutive monthly temperature values over a century:

\itemize{
\item if time scale equals 1, the time series will stay unchanged (each month is averaged by itself);
\item if time scale equals 3, the averaged values of the two first months will be NA as it is not possible to calculate an average on three values for them. Then for each successive month it will be the average of the month and the two previous months. Averaged value for month 3 will thus be the average of months 1, 2 and 3, etc. until month 1,200 that will be the average of months 1,198, 1,199 and 1,200;

\item ... the same principle applies for any time scale, as for example with a time scale equals 12, the average of the eleven first months will be NA and then calculated with values of the month and the eleven previous months.
}

Once average values are calculated, the function extracts the values for the twelve months of the year and fits normal probability density functions (PDFs) to the frequency distribution of the averaged values. The mu and sigma parameters of the normal probability density functions are thus estimated for each month of the year using the maximum-likelihood estimation (MLE) method.

The PDFs are then standardized with mean equals zero and standard deviation equals one. Twelve standardized PDFs are thus obtained to determine the probability of occurrence of a temperature value for a given month.

A STI value is actually the initial temperature value transformed into a standard deviation from the median of the standardized normal distribution of the temperature values of the same month in the time series.

The cumulative probabilities for the various STI values and interpretation can be summed as follow:

\preformatted{
         Cumulative                                           Probability
 STI     Probability  Interpretation    Class                 of occurrence
----------------------------------------------------------------------------
+2.0     0.9772       Extremely hot     STI >= +2.0           0.023
+1.5     0.9332       Very hot          +1.5 >= STI < +2.0    0.044
+1.0     0.8413       Moderately hot    +1.0 >= STI < +1.5    0.092
 0.0     0.5000       Near normal       -1.0 >  STI < +1.0    0.682
-1.0     0.1587       Moderately cold   -1.0 <= STI > -1.5    0.092
-1.5     0.0668       Very cold         -1.5 <= STI > -2.0    0.044
-2.0     0.0228       Extremely cold    -2.0 <= STI           0.023
----------------------------------------------------------------------------
}

\subsection{Input data}{
The STI is designed to be used with monthly values.

There is currently no fine tuned control on the input data. Please make sure your input data is a valid vector of integer or float time ordered temperature values not containing NAs. If NAs occur in your data, all months used for the computation of the averaged values will not be taken into account for fitting the PDFs.
}

\subsection{Time scale}{
Typical values are 1, 3, 6, 12, 24 and 48.

There is currently no fine tuned control on the parameter. Please make sure the scale parameter is an integer between 1 and a resonable number for interannual computation of the index, typically 24 or 48.
}

\subsection{Fitting method}{
Parameter fitting is based on the maximum-likelihood estimation method.
}

}

\value{
Function \code{sti} returns a time ordered series of STI values.
}

\author{
Marc Fasel <marc.fasel@unige.ch>
}

\note{Dependencies: the \code{sti} function depends on the libraries \code{fitdistrplus} and \code{zoo}.}

\examples{
data(engelberg)

sti(engelberg$Temperature, 12)
}
