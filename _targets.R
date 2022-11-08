# === Targets rgee extract ------------------------------------------------
# Alec L. Robitaille



# Source ------------------------------------------------------------------
targets::tar_source('R')




# Variables ---------------------------------------------------------------




# Data --------------------------------------------------------------------
x_mid <- -68.3559
y_mix <- 49.4672




# Targets: setup ----------------------------------------------------------
targets_setup <- c(

)





# Targets: extract --------------------------------------------------------
targets_extract <- c(

)




# Targets: all ------------------------------------------------------------
# Automatically grab all the 'targets_*' lists above
lapply(grep('targets', ls(), value = TRUE), get)


