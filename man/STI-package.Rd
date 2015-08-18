\name{STI-package}

\alias{STI-package}
\alias{STI}

\docType{package}

\title{Compute the Standardized Temperature Index}

\description{A set of functions for computing the standardized temperature index (STI).}

\details{
STI is an index representing the probability of occurrence of a temperature value when compared with temperature values on a longer period. Positive and negative STI values indicate temperatures above and below the median temperature of the long-term time period respectively. It can be used to identify anomalously hot and cold periods.

STI values are classified into "events" according to the following rules:

\preformatted{
  "Extremely hot"    when STI >=  2.00
  "Very hot"          ''  STI >=  1.50 and <  2.00
  "Moderately hot"    ''  STI >=  1.00 and <  1.50
  "Near normal"       ''  STI <   1.00 and > -1.00
  "Moderately cold"   ''  STI <= -1.00 and > -1.50
  "Very cold"         ''  STI <= -1.50 and > -2.00
  "Extremely cold"    ''  STI <= -2.00
}

Categories are relative to the temperatures at a particular location, but the standardization of the index allows for comparison across space and time at any geographic coordinate on the globe.

The STI is closely related in its principe to the Standardized Precipitation Index (SPI) as described originally in McKee and al. (1993): \url{http://ccc.atmos.colostate.edu/relationshipofdroughtfrequency.pdf}

\code{\link{sti}} is the main function of the package and computes the index on a time ordered series of temperature values. It returns a time ordered series of STI values taking into consideration a specified time scale on which the calculation is performed. Please, see the \code{\link{sti}} help page for more details.

The package includes also a function \code{\link{stiEvents}} computing the number of events occuring in a time series of STI values. See \code{\link{stiEvents}} help page for more details.

Version history:

0.1. First release.
}

\author{
Marc Fasel <marc.fasel@unige.ch>

Maintainer: Marc Fasel <marc.fasel@unige.ch>
}

\keyword{package}
