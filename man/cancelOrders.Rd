% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cancelOrders.R
\name{cancelOrders}
\alias{cancelOrders}
\title{Cancel unmatched/partially matched bets}
\usage{
cancelOrders(marketID, betIDs = NULL, sizeReductions = NULL,
  sslVerify = TRUE)
}
\arguments{
\item{sizeReductions}{vector (strings). If supplied, then this is a partial
  cancel.  The default value is NULL, which means complete cancellations are
  requested.

  Note on sizeReductions values: The double within the string represents the
  value to be cancelled. For example, given an unmatched back of £100,
  inputting "2" as the parameter value will cancel £2 of the bet and leave
  £98 unmatched.}

\item{sslVerify}{Boolean. This argument defaults to TRUE and is optional. In
some cases, where users have a self signed SSL Certificate, for example
they may be behind a proxy server, Betfair will fail login with "SSL
certificate problem: self signed certificate in certificate chain". If this
error occurs you may set sslVerify to FALSE. This does open a small
security risk of a man-in-the-middle intercepting your login credentials.}

\item{marketId}{String. The market ID of the bets to be fully or partially
cancelled. While multiple bets (up to sixty, actually) can be cancelled in
one call, they must all be from the same market. Required. Warning: Setting
this parameter to NULL will result in the full cancellation of all
unmatched bets across all markets.}

\item{betID}{vector (strings). The bet IDs of the bets to be cancelled- bet
IDs are displayed (called Ref) on the bet information on the right hand
side of market page on the betfair desktop site.}
}
\value{
If the call is successful, then the function returns "SUCCESS".
  Otherwise, a string indicating the nature of the error is returned.
}
\description{
\link{https://api.developer.betfair.com/services/webapps/docs/display/1smk3cen4v3lu3yomq5qye0ni/cancelOrders}
}
\details{
\code{cancelOrders} Cancel all bets OR cancel all bets on a market OR fully
or partially cancel particular orders on a market. Only LIMIT orders can be
cancelled or partially cancelled once placed.
}
\section{Note on sizeReductions}{
 If you want to combine partial and full
  cancellations, use "NULL" to signify the bet IDs that are to be fully
  cancelled (see examples below).
}

\section{Note on \code{cancelOrders}}{
 Unlike some other functions that
  utilised data frame structures, this function directly converts the input
  to a JSON-compatible format. The JSON output is then converted back to a
  data frame.
}
\examples{
\dontrun{
To cancel all unmatched bets (across all countries), simply run cancelOrders with marketID set to NULL
cancelOrders()

TO cancel all unmatched bets on a single market, then just pass the market ID in the marketID parameter:
cancelOrders(marketID=NULL)

To fully cancel an inidividual bet on a specific market, then  include a bet ID in betIDs parameter:
cancelOrders(marketID="1.2131241",betIDs=c("3431515121"))

To partially cancel an inidividual bet on a specific market, then  include both betIDs and sizeReduction vectors:
cancelOrders(marketID="1.2131241",betIDs=c("2451351566"),sizeReductions=c("2.0"))

If you want a mixture of complete and partial cancellations, then use "NULL" to in the sizeReductions vector to determine full cancellations.
For example, if we wanted to combine our two previous requests:
cancelOrders(marketID="1.2131241",betIDs=c("3431515121","2451351566"),c=("NULL","2.0"))

}

}
\seealso{
\code{\link{loginBF}}, which must be executed first. Do NOT use the
  DELAY application key. The DELAY application key does not support price
  data.
}
