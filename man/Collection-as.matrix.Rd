% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/methods_collection.R
\docType{methods}
\name{as.matrix,Collection-method}
\alias{as.matrix,Collection-method}
\title{Turn a collection of fingerprints into a sparse binary matrix}
\usage{
\S4method{as.matrix}{Collection}(x, ...)
}
\arguments{
\item{x}{object of class 'Collection' that needs to be turned into a sparse binary matrix}
}
\value{
object of class dgCMatrix (sparse binary matrix)
}
\description{
Turn a collection of fingerprints into a sparse binary matrix
}
\examples{
\dontrun{
# Get data
data("company_descriptions")

# Retrieve texts
txts <- lapply(company_descriptions, function(x) x$desc)

# Fingerprint
txts_fp <- do_fingerprint_document(txts)

# Or you can turn them into a sparse binary matrix
sbm <- as.matrix(txts_fp)

# This matrix works in a similar way as normal matrices
sbm[1:3, 1:8]

# You can do operations such as apply, rowSums, colSums etc.
dim(sbm)
colsums <- apply(sbm, 2, sum)
}
}
