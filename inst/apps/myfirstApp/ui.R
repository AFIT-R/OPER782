library(shiny)
library(shinythemes)
library(choroplethr)
library(choroplethrMaps)

data('df_state_demographics')
map_data <- df_state_demographics

ui <- navbarPage('',
                 theme = shinythemes::shinytheme('cerulean'),
  tabPanel(title = 'Map',
fluidPage(title = 'My First App!', 
                theme = NULL,
          sidebarLayout(
            sidebarPanel(width = 4,
              sliderInput('slider',
                          label = 'Choose the Number of Colors',
                          min = 1,
                          max = 9,
                          value = 4),
              selectInput('select',
                          label = 'Select a Column',
                          choices = colnames(map_data)[-1],
                          selected = colnames(map_data)[4])),       
               mainPanel(plotOutput('mapplot'))))),

tabPanel('Data',
         fluidPage(
           mainPanel(width = 12,
                     DT::dataTableOutput('mapdata'))))
)
