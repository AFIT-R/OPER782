fake_functions <- function(ns = 'stats') {

funcs <- getNamespaceExports(ns) 

funcs <- funcs[!grepl(pattern = '[[:punct:]]', funcs)]

for(i in 1:length(funcs)) {
  
  assign(paste0(funcs[i],'_me'), 
         eval(parse(text = paste0(ns,'::',funcs[i]))),
         envir = .GlobalEnv)
}
}