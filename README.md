
# (A) Installation

## Windows
- R 

## Ubuntu
Im Terminal

```sh
# R
sudo apt install r-base

# Dependencies
sudo apt-get install libcurl4-openssl-dev
sudo apt-get install libarchive-dev
```


# (B) R Packages installieren

Starte `R` und installiere:

```r
# install the latest shinylive
if (!require("pak")) install.packages("pak")
pak::pak("posit-dev/r-shinylive")
# install libs for app.R
install.packages("shiny")
install.packages("ggplot2")
```


# (C) Checke ob app.R läuft
Im bash Terminal
```sh
myfolder=$(pwd)
R -e "shiny::runApp('${myfolder}')"
```


# (D) Erzeuge HTML Code
In der R CLI:

```R
shinylive::export("myapp", "site")

# Teste im Anschluss
httpuv::runStaticServer("site")
```


# (D) Setup Github Pages



# Links
https://github.com/posit-dev/r-shinylive

