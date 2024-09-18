#===================================================
# Tidyverse packages:
#===================================================
packs.tidyverse <- c(
  "ggplot2", "dplyr", "purrr", "tidyr", "readr", "tibble",
  "stringr", "forcats"
)

#===================================================
# Required packages:
#===================================================
# fil <- "/Users/axelnohturfft/Dropbox/Correspondence/External_work/Uni_Surrey_2024_25/USurrey_Sessions/USurrey_2425_Session_01/packages_1.txt"
# packs.required <- scan(file=fil, what="character")
# length(packs.required) # 62
# packs.required
# dput(packs.required)
packs.tmp.1 <- c(
  "bslib", "cachem", "cellranger", "cli", "colorspace", "crosstalk", 
  "data.table", "digest", "dplyr", "DT", "ellipsis", "esquisse", 
  "evaluate", "fansi", "farver", "fastmap", "generics", "ggplot2", 
  "glue", "gtable", "htmltools", "htmlwidgets", "httr", "jquerylib", 
  "jsonlite", "knitr", "labeling", "lattice", "lazyeval", "lifecycle", 
  "magrittr", "Matrix", "mgcv", "munsell", "nlme", "openxlsx", 
  "pillar", "pkgconfig", "plotly", "purrr", "R6", "Rcpp", "readxl", 
  "rematch", "rlang", "rmarkdown", "rstudioapi", "sass", "scales", 
  "sessioninfo", "stringi", "stringr", "tibble", "tidyr", "tidyselect", 
  "utf8", "vctrs", "viridisLite", "withr", "xfun", "yaml", "zip"
)

packs.tmp.2 <- setdiff(packs.tmp.1, packs.tidyverse)

packs.required <- c("tidyverse", packs.tmp.2)
rm(packs.tmp.1, packs.tmp.2)

cat("Number of REQUIRED packages: ",
    length(packs.required), "\n\n", sep="")

#===================================================
# Already installed packages:
#===================================================
packs.installed <- row.names(utils::installed.packages())
cat("Number of already INSTALLED packages: ",
    length(packs.installed), "\n\n", sep="")


#===================================================
# Missing packages:
#===================================================
packs.missing <- setdiff(packs.required, packs.installed)
cat("Number of MISSING packages: ",
    length(packs.missing), "\n\n", sep="")


#===================================================
# Update installed packages:
#===================================================
packs.update <- setdiff(packs.installed, packs.required)
cat("Number of installed packages to update: ",
    length(packs.update), "\n\n", sep="")

if (length(packs.missing) > 0) {
  if (length(packs.update) > 0) {
    for (pack.i in packs.update) {
      message(paste("Try to update package:", pack.i), "\n")
      # try(
      #   utils::update.packages(pack.i, ask=FALSE),
      #   silent=FALSE
      # )
    }
  }
}
if (exists("pack.i")) rm(pack.i)

#===================================================
# Install missing packages:
#===================================================
# In many cases, packages might have been installed as dependencies
# previously. so, before installing a package, check whether it has
# already been installed earlier.
if (length(packs.missing) > 0) {
  for (pack.i in packs.missing) {
    message(paste("Try to install package:", pack.i), "\n")
    installed.packs.updated <- row.names(utils::installed.packages())
    if (pack.i %in% installed.packs.updated) {
      cat(pack.i, "already installed.\n")
    } else {
      try(
        utils::install.packages(pack.i, ask=FALSE)
      ) # end try
    } # end if
  } # end for
} # end if
if (exists("pack.i")) rm(pack.i)

utils::install.packages(pkgs=packs.missing)


