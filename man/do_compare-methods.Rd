% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/generics.R, R/methods_fingerprint.R,
%   R/methods_other.R
\docType{methods}
\name{do_compare}
\alias{do_compare}
\alias{do_compare,Fingerprint-method}
\alias{do_compare,dgCMatrix-method}
\title{Similarity/Distance between fingerprints}
\usage{
do_compare(x, y, method = c("cosine", "jaccard", "dice", "gilbertwells",
  "dennis", "sorgenfrei", "lancewilliams", "euclid", "hamming", "other"), ...)

\S4method{do_compare}{Fingerprint}(x, y, method = c("cosine", "jaccard",
  "dice", "gilbertwells", "dennis", "sorgenfrei", "lancewilliams", "euclid",
  "hamming", "other"), ...)

\S4method{do_compare}{dgCMatrix}(x, y, method = c("cosine", "jaccard", "dice",
  "gilbertwells", "dennis", "sorgenfrei", "lancewilliams", "euclid", "hamming",
  "other"), ...)
}
\arguments{
\item{x}{either an object of class Filter, Expression, Term or Document or an object of class 'cdgMatrix' for which you want to calculate similarities. This matrix can be obtained by calling 'as.matrix()' on a Collection class.}

\item{y}{reference fingerprint. Can be: a Filter, Expression, Term or Document class}

\item{method}{one of the following: "cosine", "jaccard", "dice", "gilbertwells", "dennis", "sorgenfrei" (similarity) or "lancewilliams", "euclid", "hamming" (distance). Note: if you choose 'other', you must pass an additional parameter 'func' with the comparison function of your choice.}

\item{...}{you can pass your own comparison method. Use 'func = function(x, y) { YOURFUNCTION }'}
}
\value{
similarity or distance metric between two fingerprints or a matrix of length n of similarity/distance metrics between documents and reference fingerprint
}
\description{
Calculate a variety of similarity and distance metrics
}
\details{
You can compare either a sparse binary matrix obtained by turning a Collection object into a matrix with another fingerprint (a Document, Expression, Term or Filter), or by simply passing two Fingerprint objects.
}
\examples{
\dontrun{
# Get data
data("company_descriptions")

# Put text in a list
txt <- lapply(company_descriptions, function(x) x$desc)

# Fingerprint documents
txt_fp <- do_fingerprint_document(txt)

# Fingerprint a term
trm_fp <- do_fingerprint_term("finance")

# We can compare:
#  - a document with a document
do_compare(txt_fp[[1]], txt_fp[[2]])
#  - a term with a document
do_compare(txt_fp[[1]], trm_fp)
#  - an expression with a document
#  ... anything with a fingerprint

# We can also compare a sparse binary matrix
# with another fingeprint

# Convert the fingerprinted documents to a matrix
txt_fp_mat <- as.matrix(txt_fp)
# Compare to term
do_compare(txt_fp_mat, trm_fp)
}
}
\seealso{
\href{http://www.iiisci.org/journal/CV$/sci/pdfs/GS315JG.pdf}{This} paper with similarity metrics
}
