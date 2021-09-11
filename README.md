# misinformation-exposure score: a score calculated based on public figures accounts followed on Twitter


## About

This package provides an R implementation to calculate misinformation-exposure score based falsity score of public figures a user follows.

The falsity score is based on PolitiFact fact-checks of the public figures.

## Installation

The development version of the
[misinformation-exoposure](https://github.com/mmosleh/minfo-exposure) library can be
installed in [R](https://r-project.org) with the following:

``` r
# install.packages("devtools")
devtools::install_github("mmosleh/minfo-exposure")
```

## Quick start guide

All you need to do is give a list of Twitter users (either screen names or user IDs) and the function returns the number of rated public figures followed along with the misinformation-exposure score. 

The functions relies on Rtweets library and needs to authenticate with your Twitter account first time you run the code.

``` r
library(mediascores)
library(misinfo.exposure')

misinfo.scores <- misinfo.exposure::misinfo_exposure_score(c('user1','user2'))
print(misinfo.scores)
```

