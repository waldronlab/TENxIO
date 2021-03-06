% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/TENxFile-class.R
\name{TENxFile}
\alias{TENxFile}
\title{TENxFile constructor function}
\usage{
TENxFile(resource, extension, ...)
}
\arguments{
\item{resource}{character(1) The path to the file}

\item{extension}{character(1) The file extension for the given resource. It
can usually be obtained from the file path. An override can be provided
especially for \code{ExperimentHub} resources where the file extension is
removed.}

\item{...}{Additional inputs to the low level class generator functions}
}
\description{
The \code{TENxFile} constructor function serves as the
auto-recognizer function for 10X files. It can import several different
file extensions, namely:
\preformatted{
    * H5 - on-disk HDF5
    * MTX - matrix market
    * .tar.gz - compressed tarball
}
}
\examples{

h5f <- "~/data/10x/pbmc_3k/pbmc_granulocyte_sorted_3k_filtered_feature_bc_matrix.h5"
con <- TENxFile(h5f)
import(con)

## from ExperimentHub
hub <- ExperimentHub::ExperimentHub()
fname <- hub[["EH1039"]]
TENxH5(fname, group = "mm10", version = "2")
TENxH5(fname, extension = "h5", group = "mm10", version = "2")
TENxFile(fname, extension = "h5", group = "mm10", version = "2")

## compressed
h5c <- "~/data/10x/pbmc_3k/pbmc_granulocyte_sorted_3k_filtered_feature_bc_matrix.tar.gz"
comp <- TENxFile(h5c)
import(comp)

}
