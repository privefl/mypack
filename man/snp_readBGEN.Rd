% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/read-bgen.R
\name{snp_readBGEN}
\alias{snp_readBGEN}
\title{Read BGEN files into a "bigSNP"}
\usage{
snp_readBGEN(
  bgenfiles,
  backingfile,
  list_snp_id,
  ind_row = NULL,
  bgi_dir = dirname(bgenfiles),
  read_as = c("dosage", "random"),
  ncores = 1
)
}
\arguments{
\item{bgenfiles}{Character vector of paths to files with extension ".bgen".
The corresponding ".bgen.bgi" index files must exist.}

\item{backingfile}{The path (without extension) for the backing files
for the cache of the \link[=bigSNP-class]{bigSNP} object.}

\item{list_snp_id}{List (same length as the number of BGEN files) of
character vector of SNP IDs to read. These should be in the form
\code{"<chr>_<pos>_<a1>_<a2>"} (e.g. \code{"1_88169_C_T"} or \code{"01_88169_C_T"}).
\strong{This function assumes that these IDs are uniquely identifying variants.}}

\item{ind_row}{An optional vector of the row indices (individuals) that
are used. If not specified, all rows are used.\cr
\strong{Don't use negative indices.}}

\item{bgi_dir}{Directory of index files. Default is the same as \code{bgenfiles}.}

\item{read_as}{How to read BGEN probabilities? Currently implemented:
\itemize{
\item as dosages (rounded to two decimal places), the default,
\item as hard calls, randomly sampled based on those probabilities
(similar to PLINK option '\verb{--hard-call-threshold random}').
}}

\item{ncores}{Number of cores used. Default doesn't use parallelism.
You may use \code{\link[=nb_cores]{nb_cores()}}.}
}
\value{
The path to the RDS file that stores the \code{bigSNP} object.
Note that this function creates one other file which stores the values of
the Filebacked Big Matrix.\cr
\strong{You shouldn't read from BGEN files more than once.} Instead, use
\link{snp_attach} to load the "bigSNP" object in any R session from backing files.
}
\description{
Function to read the UK Biobank BGEN files into a \link[=bigSNP-class]{bigSNP}.
}
\details{
For more information on this format, please visit
\href{https://bitbucket.org/gavinband/bgen/}{BGEN webpage}.

This function is designed to read UK Biobank imputation files. This assumes
that variants have been compressed with zlib, that there are only 2 possible
alleles, and that each probability is stored on 8 bits. For example, if you
use \emph{qctool} to generate your own BGEN files, please make sure you are using
options '\verb{-ofiletype bgen_v1.2 -bgen-bits 8}'.

You can look at some example code from my papers on how to use this function:
\itemize{
\item https://github.com/privefl/paper-ldpred2/blob/master/code/prepare-genotypes.R#L1-L62
\item https://github.com/privefl/paper4-bedpca/blob/master/code/missing-values-UKBB.R#L34-L75
\item https://github.com/privefl/UKBiobank/blob/master/10-get-dosages.R
}
}
