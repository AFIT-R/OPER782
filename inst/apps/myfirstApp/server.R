data('df_state_demographics')
map_data <- df_state_demographics

server <- function(input, output) {

output$mapplot <- renderPlot({

  map_data$value = map_data[, input$select]
    
  state_choropleth(map_data,
                   title = 'stuff', 
                   num_colors = input$slider)
})

output$mapdata <- DT::renderDataTable({
  
  DT::datatable(map_data)
  

})
}
