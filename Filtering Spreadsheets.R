#Filtering sheets

library("dplyr")
library("plyr")
library("tidyr")
library("ggplot2")

exportresults <- read.csv("D122782_export_results_2024-07-26_18-47-11.csv", check.names = F)

plate1_gb <- c('6319','18436','19855','8613','9885')
plate2_gb <- c('10429','10596','11079','12303','14975','19413','4490','9019','10358','10707','11831','13957','14729','14994','18046','18211','18555')

exportresults_filtered <- exportresults %>%
  filter(PenId %in% c(plate1_gb, plate2_gb))


write.csv(exportresults_filtered,"~/Desktop/ExportResultsRbM77com.csv", row.names = FALSE)


