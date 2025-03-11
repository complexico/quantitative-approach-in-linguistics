# code to prepare the Linguistics Vanguard data (Rajeg et al. 2022) (https://doi.org/10.1515/lingvan-2020-0104)
# cf. the `shell-code.sh` for the code to download these data from the data repository (https://doi.org/10.17605/OSF.IO/QF38H)

library(tidyverse)
library(writexl)
# https://github.com/gederajeg/lingvan-voice/blob/main/imr_gpwr_wa_lingvang_revision_codes.R

#' # Analysis for *majukan*, *memajukan* and *dimajukan* {#majukan-all}
#' 
#' ## Corpus data for *majukan*
#' 
## ----majukan-voice-and-sense-categorising-new---------------------------------------
# read the concordance data
majukan <- readRDS("../lingvan-voice/majukan_BARE_all_data.rds") %>% 
  mutate(node = tolower(node))

#' 
## ----majukan-voice-count-new--------------------------------------------------------
majukan_voice_tb <- majukan %>% 
  filter(str_detect(sense, "^irrel", negate = TRUE)) %>% 
  count(voice, sort = TRUE) %>% 
  mutate(perc = round((n/sum(n) * 100), 2))

#' 
## ----majukan_phys_motion_examples---------------------------------------------------
majukan_phys_motion_df <- subset(majukan, sense=="phys_motion")


#' 
## ----memajukan-load-data------------------------------------------------------------
memajukan <- readRDS("../lingvan-voice/majukan_AV_sample_data.rds") %>% 
  filter(senses != "duplicate") %>% 
  rename(sense = senses) %>% 
  mutate(node = tolower(node))

#' 
## ----dimajukan-load-data------------------------------------------------------------
dimajukan <- readRDS("../lingvan-voice/majukan_PASS_sample_data.rds") %>% 
  filter(!sense %in% c("duplicate", "phys_motion")) %>% 
  mutate(node = tolower(node))
dimajukan_physmotion <- readRDS("../lingvan-voice/majukan_PASS_sample_data.rds") %>% 
  filter(sense %in% c("phys_motion"))

#' 
## ----majukan-combined-voice---------------------------------------------------------
memajukan1 <- memajukan %>% 
  select(corpus, sent_id, left, node, right, sense) %>% 
  mutate(voice = "av")
dimajukan1 <- dimajukan %>% 
  select(corpus, sent_id, left, node, right, sense) %>% 
  mutate(voice = "pass")
majukan1 <- majukan %>%
  filter(str_detect(sense, "^(irrel|phys_m)", negate = TRUE)) %>% 
  select(corpus, sent_id, left, node, right, sense, voice)
majukan_combined <- bind_rows(filter(majukan1, voice == "uv"), 
                              memajukan1, 
                              dimajukan1) %>% 
  mutate(sense = replace(sense, sense == "propose", "proposing"),
         sense = replace(sense, sense == "temporal", "cause to happen earlier"),
         sense = as.factor(sense), 
         sense = fct_relevel(sense, "proposing", after = 3)) |> 
  
  ## exclude Undergoer Voice as its frequency is very small
  filter(voice != "uv")

majukan_combined |> 
  write_tsv("data/vanguard-majukan.txt")
majukan_combined |> 
  write_xlsx("data/vanguard-majukan.xlsx")

# fs::file_move("lingvan-voice", "../lingvan-voice")
