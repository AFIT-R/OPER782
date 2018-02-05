ui = navbarPage(title = 'Normal Distribution',
                collapsible = T, 
                position = 'fixed-top',
                theme  = shinythemes::shinytheme('flatly'),
                
# tabPanel('Shiny App',
#          ),

tabPanel('Distribution Functions',
         uiOutput('norfunc')),

tabPanel('Distribution Properties',
         uiOutput('norprops')))
