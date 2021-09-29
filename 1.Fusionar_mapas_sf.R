#### Paquetes ####

pacman::p_load(sf, mapSpain, tidyverse)

##### Ojo! Trabajo directamente con sf, si tenemos shp habria que importarlos
#y pasarlos a sf#####

#Mapa de españa

sf_spain <- esp_get_ccaa() %>% 
  
  st_transform(crs = 4326)   #Transformamos de ETRS89 a WGS84
  
  
#Cogemos Murcia, clm y comvalenciana
  

murcia <- sf_spain %>% 
  
          filter(ine.ccaa.name == "Murcia, Región de")


clm <- sf_spain %>% 
  
          filter(ine.ccaa.name == "Castilla - La Mancha")

cv <- sf_spain %>% 
  
          filter(ine.ccaa.name == "Comunitat Valenciana")


# Ya las tenemos, primero comprobaríamos que todas tienen el mismo crs

st_crs(murcia)

st_crs(clm)

st_crs(cv)

#Aquí comprobación logica (Debería dar TRUE)

st_crs(murcia) == st_crs(clm) & st_crs(murcia) == st_crs(cv) 


# Todo el mapa junto (separado)

juntos <- rbind(murcia, clm, cv)

plot(juntos)

# Todas las areas juntas

prueba <- st_union(murcia, clm) %>% 
          
          st_union(cv)  

plot(prueba)


