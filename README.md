# Demo wie r-shinylive um eine ShinyApp drumherumgebastelt wird

Der Ansatz ist, dass die ShinyApp in HTML Code umgewandelt wird, 
und dann über Github Pages ins Netz gestellt wird.

Es wäre auch möglich den HTML/JS Code woanders zu deployen, 
z.B. einen klassischen Webserver.


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
shinylive::export("myapp", "docs")

# Teste im Anschluss
httpuv::runStaticServer("docs")
```


# (D) Setup Github Pages

1. Menuleiste oben: "Settings"
2. Seitenmenu: "Pages"
3. Source: "Deploy from Branch"
4. Branch: Wähle Ordner "docs" aus


# (E) Trigger deployment

Github-Pages wird bei jeden Commit auf der main-Branch automatisch getriggert.

Manuell geht es wie folgt:

Weg 1: Auf github.com klicke in Menuleiste auf "Actions" 

oder

Weg 2:
```R
install.package(usethis)
usethis::use_github_action(url="https://github.com/posit-dev/r-shinylive/blob/actions-v1/examples/deploy-app.yaml")
```


# Links
https://github.com/posit-dev/r-shinylive

