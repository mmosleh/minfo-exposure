# misinformation-exposure score: a score calculated based on public figures accounts followed on Twitter
You can use the R package or the API service we have develope to calculate misinformation-exposure score at scale.

## Citation
If you use our method please cite the following:
Mosleh, M., Rand, D.G. Measuring exposure to misinformation from political elites on Twitter. Nat Commun 13, 7144 (2022). https://doi.org/10.1038/s41467-022-34769-6

## Website
You can use the following webiste to check the misinformation exposure score for a give Twitter handle or user id.

https://misinfoexpose.com/

## API service
All you need is to create an account on https://rapidapi.com/ (it is free!)

You can find the instruction to use the API here: https://rapidapi.com/mescalcapi-mescalcapi-default/api/mescalc
It is very strightforward: 

The input is either Twitter screen_name or Twitter ID and the output is misinifo exposure in [0,1], partisanship [-1,1] (-1 dem, 1 rep), and list of political elites the user followers.

For example in R:
``` r
library(httr)

screen_name<-'dg_rand'
url <- paste("https://mescalc.p.rapidapi.com/account/",tolower(screen_name),sep='')

response <- VERB("GET", url, add_headers('X-RapidAPI-Host' = 'mescalc.p.rapidapi.com', 'X-RapidAPI-Key' = 'SIGN-UP-FOR-KEY'), content_type("application/octet-stream"))

content(response, "text")
```

And in Python:
``` r
import requests

screen_name='dg_rand'
url = "https://mescalc.p.rapidapi.com/account/{}".format(screen_name.lower())

headers = {
	"X-RapidAPI-Host": "mescalc.p.rapidapi.com",
	"X-RapidAPI-Key": "SIGN-UP-FOR-KEY"
}

response = requests.request("GET", url, headers=headers)

print(response.text)
```

## R package
## R version 4.0.4

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

library(misinfo.exposure)

misinfo.scores <- misinfo.exposure::get_misinfo_exposure_score(c('user1','user2'))
print(misinfo.scores)
```

