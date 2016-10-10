library(ggplot2)
library(reshape2)


setwd("C:/Users/Alexey/Dropbox/Герман/Ngram_over_time/")

plot_timeseries_data <- function(csv_name){
  data <- read.csv(csv_name, sep = ";", header=TRUE, stringsAsFactors=FALSE)
  colnames(data) <- c("Год", "Облако в штанах", "Флейта-позвоночник", "Человек", "Люблю", "Про Это", "Ленин", "Хорошо", "Во весь голос")
  data <- melt(data ,  id.vars = 'Год', variable.name = 'series')
  p <- ggplot(data, aes(Год,value)) + 
    geom_line() + 
    scale_x_continuous(breaks = seq(1915,2010,5),
                     limits = c(1915,2010)) +
    theme(axis.text.x = element_text(size = 8, angle=45),
          legend.position = "top") +
    xlab("Годы")+
    ylab("Относительная цитируемость") +
    facet_wrap(~series, ncol = 1)
  ggsave(filename=paste0(csv_name,".png"), plot=p,
         device = "png", 
         width = 20,
         height = 10)
}

plot_timeseries_data("median.csv")
plot_timeseries_data("mean.csv")
plot_timeseries_data("mean_5years.csv")
