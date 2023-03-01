## ---- echo=FALSE--------------------------------------------------------------
library(rmarkdown)

## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE-----------------------------------------------------------
library(ptable)

## -----------------------------------------------------------------------------
packageVersion("ptable")

## -----------------------------------------------------------------------------
# note: 
# all parameters except for maximum noise D and variance V have default values
ptab <- create_cnt_ptable(D = 2, V = 1)

## -----------------------------------------------------------------------------
str(ptab)

## -----------------------------------------------------------------------------
# note: to look at a specific slot, just name the object and add the 
# corresponding slot with a leading "@"
ptab@tMatrix

## -----------------------------------------------------------------------------
diag(ptab@tMatrix)

## -----------------------------------------------------------------------------
# let's have a look at the number of different original positive frequency 
# counts that will be treated
params <- slot(ptab, "pParams")
params@ncat
# if this number is added by +1 (for the zero count) we get
params@ncat + 1

## -----------------------------------------------------------------------------
# the object @pClasses shows all original frequencies 
# that have their own distribution
ptab@pClasses

# symmetry is achieved for the original frequency count i=...
max(ptab@pClasses)
# or
ptab@pClasses[params@ncat + 1]

## ---- echo=FALSE--------------------------------------------------------------
a <- ptab@tMatrix[max(ptab@pClasses) + 1, ]
names(a) <- as.character(c(1:5))
a

## ---- echo=FALSE--------------------------------------------------------------
b <- ptab@tMatrix[max(ptab@pClasses) + 1, ]
names(b) <- as.character(12326 + c(-2:2))
b

## -----------------------------------------------------------------------------
ptab@empResults

## -----------------------------------------------------------------------------
ptab_new <- create_cnt_ptable(D = 2, V = 0.9)
ptab_new@empResults

## -----------------------------------------------------------------------------
ptab_new@tMatrix

## -----------------------------------------------------------------------------
ptab_new@pTable

## -----------------------------------------------------------------------------
mod_ptab_new <-
  modify_cnt_ptable(ptab_new, threshold = 0.2, seed = 123)

## -----------------------------------------------------------------------------
mod_ptab_new@pTable

## -----------------------------------------------------------------------------
# note:  once again, check the diagonal entries
ptable_e21 <- create_cnt_ptable(D = 4, V = 1, pstay = 0.5)
# note:  once again, check the empirical results or the diagonal entries
ptable_e21@empResults
diag(ptable_e21@tMatrix)

## -----------------------------------------------------------------------------
ptable_e22 <- create_cnt_ptable(D = 5, V = 3, js = 2)
ptable_e22@tMatrix

## -----------------------------------------------------------------------------
result <- create_cnt_ptable(D = 4, V = 1)
params <- slot(result, "pParams")
# and let's check the number of different positive original frequencies
params@ncat

## -----------------------------------------------------------------------------
# note: so far we have used a scalar for "pstay"", but now we use a vector
result <-
  create_cnt_ptable(D = 4,
                    V = 1,
                    pstay = c(0.5, 0.5, 0.7, 0.8))
params <- slot(result, "pParams")

# let's check the results
result@empResults

## -----------------------------------------------------------------------------
# note: in the example we are working with the following result
result <-
  create_cnt_ptable(
    D = 2,
    V = 1.08,
    js = 1,
    mono = c(TRUE, TRUE, FALSE, TRUE)
  )

## ---- fig.height=5, fig.width = 7---------------------------------------------
# note:  we have to use the argument type for specifying the plot
plot(result, type = "t")

## ---- fig.height=5, fig.width = 7---------------------------------------------
plot(result, type = "p")

## ---- fig.height=5, fig.width = 7---------------------------------------------
plot(result, type = "d")

## ---- eval=FALSE--------------------------------------------------------------
#  plot(result, type = "d", file = "graph.pdf")

## ---- eval=FALSE--------------------------------------------------------------
#  # for Tau-Argus
#  pt_export(result, file = "ptable.txt", SDCtool = "TauArgus")
#  # or for SAS
#  pt_export(result, file = "ptable.txt", SDCtool = "SAS")

## -----------------------------------------------------------------------------
result <-
  create_cnt_ptable(D = 4,
                    V = 1.5,
                    pstay = c(0.8, 0.9, 0.9, 0.9))
# let's check the results
result@empResults

## ---- fig.height=5, fig.width = 7---------------------------------------------
plot(result, type = "d")

## ---- fig.height=5, fig.width = 7---------------------------------------------
result <-
  create_cnt_ptable(D = 4,
                    V = 1.225,
                    pstay = c(0.8, 0.9, 0.9, 0.9))
plot(result, type = "d")

## ---- fig.height=5, fig.width = 7---------------------------------------------
result <- create_cnt_ptable(
  D = 4,
  V = 1.5,
  pstay = c(0.8, 0.9, 0.9, 0.9),
  mono = c(FALSE, TRUE, TRUE, TRUE)
)
plot(result, type = "d")

## -----------------------------------------------------------------------------
res <- create_num_ptable(D = 2, V = 1, icat = c(1, 2))

