\name{stiEvents}

\alias{stiEvents}

\title{Compute events from STI values}

\description{
\code{stiEvents} returns a vector containing events occurence computed from the given STI values.
}

\usage{
stiEvents(values)
}

\arguments{
  \item{values}{ a time ordered series of STI values.}
}

\details{
The \code{stiEvents} function allows computing events from a time ordered series of STI values. Events are defined as:

\preformatted{
  "Extremely hot"    when STI >=  2.00
  "Very hot"          ''  STI >=  1.50 and <  2.00
  "Moderately hot"    ''  STI >=  1.00 and <  1.50
  "Near normal"       ''  STI <   1.00 and > -1.00
  "Moderately cold"   ''  STI <= -1.00 and > -1.50
  "Very cold"         ''  STI <= -1.50 and > -2.00
  "Extremely cold"    ''  STI <= -2.00
}

}

\value{
\code{stiEvents} returns a vector of events occurence from "Extremely hot" to "Extremely cold".

}

\author{
Marc Fasel <marc.fasel@unige.ch>
}

\examples{
data(engelberg)

stiEvents(sti(engelberg$Temperature, 12))
}
