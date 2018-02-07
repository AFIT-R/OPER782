server = function(input, output, session) {
  
      
  
output$norfunc  <- renderUI({ 
  
  file = 'nor-func.Rmd'
  withMathJax(HTML(markdown::markdownToHTML(knitr::knit(file))))
})

output$norprops <- renderUI({ 
  
  file = 'nor-props.Rmd'
  withMathJax(HTML(markdown::markdownToHTML(knitr::knit(file))))}) 
}