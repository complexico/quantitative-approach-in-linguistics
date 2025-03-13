# code to prepare the BERI paper (Rajeg 2022) (http://dx.doi.org/10.6084/m9.figshare.20375955) for practising the chi-square test

library(tidyverse)

read_tsv("https://raw.githubusercontent.com/gederajeg/berikan/refs/heads/main/data/df_beri.txt") |> 
  write_tsv("data/rajeg_2022_beri.txt")