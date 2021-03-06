% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/MapTaxaObs.R
\name{MapTaxaObs}
\alias{MapTaxaObs}
\title{Taxa Observation Maps}
\usage{
MapTaxaObs(obs, xWalk, dirMain = getwd(), onlymatches = TRUE,
  dirData = "Data", dirGIS = "GIS", dirMaps = "Maps", verbose = TRUE)
}
\arguments{
\item{obs}{Excel file containing 3 columns: TaxaName, Latitude83, Longitude83}

\item{xWalk}{Crosswalk (Excel file) of taxa names between taxa name in
occurence file and file name outputs for maps.  Three columns (CommonName,
Species, MapName).}

\item{dirMain}{Path for folder containing obs and xwalk. Optional.
Default = getwd().}

\item{onlymatches}{Flag for mapping obs taxa matching xwalk taxa, or all
taxa. Optional. Default = TRUE.}

\item{dirData}{Subdirectory of "dir" specified above with data files.
Default = "Data"}

\item{dirGIS}{Subdirectory of "dir" specified above with GIS files.
Default = "GIS"}

\item{dirMaps}{Subdirectory of "dir" specified above for map outputs.
Default = "Maps"}

\item{verbose}{Boolean value for including feedback to the user that the
script is working.  Default = TRUE.}
}
\value{
Saves the maps and a dataframe of observed taxa not matching xwalk
taxa to the dirMaps folder.
}
\description{
Map taxonomic observations in Maryland.  Inputs are 3 GIS shapefiles
(State, County, and Hydrology) for Maryland, Observations (taxa names and
Lat/Longs), and #' a crosswalk table of taxa names and map names.  Input
files are assumed to be Excel with the data on the first worksheet.
}
\details{
The example data is fish but can be used for benthic macroinvertebrates as
well.
Maps are output as PNG.  There is a flag for "only" matches between the data
and the crosswalk table (this is the default).
There is also a "verbose" flag for printing status messages to the user (this
 is the default).
Tests for existence of Data, GIS directories and required files. On failure,
stops and prints missing directories/files to screen.

The R libraries rgdal and readxl are required for this function.
}
\examples{
# Set Working Directory
wd <- getwd()
# Create Example Data if Needed
## Create Directories
myDir.create <- file.path(wd,"Data")
ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory
already exists")
myDir.create <- file.path(wd,"GIS")
ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory
already exists")
myDir.create <- file.path(wd,"Maps")
ifelse(dir.exists(myDir.create)==FALSE,dir.create(myDir.create),"Directory
already exists")
## Create Data
### Taxa Data
myFiles <- c("AllFish_95to16.xls", "TaxaMapsCrossWalk20170731.xlsx")
file.copy(file.path(path.package("MBSStools"),"extdata",myFiles),
file.path(wd,"Data",myFiles))
### GIS
unzip(file.path(path.package("MBSStools"),"extdata","MD_GIS.zip"),
exdir=file.path(wd,"GIS"))

# Inputs
Obs <- "AllFish_95to16.xls"
XWalk <- "TaxaMapsCrossWalk20170731.xlsx"
wd <- getwd()

# Create maps
MapTaxaObs(Obs, XWalk, wd)
}
