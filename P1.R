library(shiny)
library(here)
library(tidyverse)
library(ggplot2)

ui <- fluidPage()

server <- function(input, output){

  here::here()
  alldata=read.csv("time_series_covid19_deaths_US.csv")
  
  daysum=alldata %>% summarise_at(vars(contains("20")),funs(sum))
  df2 = data.frame(t(daysum))
  day=c(1:(nrow(df2)-1))
  
  new_cases = data.frame(day,"new cases"=rep(NA,length(day)))
  
  row_count=1
  for(i in 1:(length(daysum)-1)){
    new_cases[row_count,2]=daysum[i+1]-daysum[i]
    row_count=row_count+1
  }
  
  ggplot(new_cases,aes(day,new.cases))+geom_line()+labs(title="Plot of COVID-19 new death/case vs time",x="Day", y = "Cases")+
    theme_classic()
}
shinyApp(ui = ui, server = server)