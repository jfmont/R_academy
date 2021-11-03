library("tidyverse")

#Creamos Vector

#1. Hacemos los dígitos

digitos <- seq(10000, 20000, 1)

#2. Pegamos para hacer un vector largo con todos los números

vector_prueba<- str_glue("Id_control_{digitos}_20xx")

# Extraemos solo los números que nos interesan

                

solo_digitos <- vector_prueba %>% #Cogemos vector de intéres
  
  #Con str_extract_all extraemos todo lo que coíncida con 
  #patrón que indiquemos
  
  #En pattern incluimos una regular expression que quiere decir:
  # "Selecciona la cadena que coincida con "5 digitos juntos"
  # ddddd
  
  str_extract_all(pattern = "\\d{5}")

solo_digitos


