# Packages
library(ggplot2)
library(igraph)
library(dplyr)
library(jasmines)
library(scico)
library(devtools)
library(viridis)
remotes::install_github("djnavarro/jasmines")
remotes::install_github("thomasp85/ambient")

# library(mathart)
# library(ggart)
# library(ggforce)
# library(Rcpp)
# library(tidyverse)


# To check the palette names
scico_palette_names()


#
set.seed(89984)
scene_bubbles(n = 10, grain = 100) %>%
  unfold_warp(iterations = 22,output = "time", scale = 17) %>%
  style_ribbon(palette = palette_named("turku"),background = "white") 

#
set.seed(8804)
scene_bubbles(n = 200) %>%
  unfold_warp(iterations = 1,output = , scale = 14) %>%
  style_ribbon(palette = palette_named("devon"),background = "white") 


#
use_seed(9) %>%
  scene_discs(
    rings = 9, points = 5000, size = 9
  ) %>%
  unfold_warp(
    iterations = 1,
    scale = .3, 
    output = "layer" 
  ) %>%
  unfold_tempest(iterations = 40,scale = .01) %>%
  style_ribbon(
    palette = palette_named("berlin"),
    colour = "ind",
    alpha = c(.2,8),
    background = "white"
  ) 



#
use_seed(1) %>%
  scene_discs(
    rings = 9, points = 500, size = 100
  ) %>%
  unfold_warp(
    iterations = 3,
    scale = .9, 
    output = "layer") %>%
  unfold_tempest(iterations = 30,scale = .08, scatter = FALSE) %>%
  style_ribbon(
    palette = palette_named("lapaz"),
    colour = "ind",
    alpha = c(.4,3),
    background = "black"
  ) 

# 
use_seed(1) %>%
  scene_discs(
    rings = 3, points = 10, size = 9
  ) %>% unfold_breeze(iterations = 1,drift = .04,octaves = 5) %>%
  unfold_tempest(iterations = 5,scale = .7) %>%
  style_ribbon(
    palette = palette_named("lapaz"),
    colour = "ind",
    alpha = c(.4,3),
    background = "white"
  ) 

# 
use_seed(79888) %>%
  entity_circle(grain = 10, size =2) %>%
  unfold_tempest(iterations = 80) %>%
  style_ribbon(background = "white",palette = palette_named("devon"))




# scenebubbles > unfoldtempest 
scene_bubbles(n = 20) %>%
  unfold_tempest(iterations = 10) %>%
  style_ribbon(palette = palette_named("acton"), background = "white")


#scenebuubles > unfoldtempest
# round like a solar eclipse, iterations 99
scene_bubbles(n = 5) %>%
  unfold_warp(iterations = 99)  %>%
  style_ribbon(palette = palette_named("acton"), background = "white")


# 
scene_bubbles(n = 1) %>%
  unfold_warp(iterations = 909, scale = 0.9)  %>%
  style_ribbon(palette = palette_named("bilbao"),alpha = c(.4,.038), background = "white")



#
set.seed(4)
scene_bubbles(n = 6) %>%
  unfold_tempest(iterations = 500,  scale = 0.09) %>%
  style_ribbon(palette = palette_named("bilbao"), background = "white",alpha = c(.4,.08)) 


# unfold warp = alcubierre drive?
set.seed(20990) %>%
  scene_bubbles(n = 2) %>%
  unfold_warp(iterations = 55) %>%
  style_ribbon(palette = palette_named("bilbao"), background = "white") 



# Unfold loop
set.seed(8888)
scene_bubbles(n = 2) %>%
  unfold_loop() %>%
  style_ribbon(palette = palette_named("bilbao"), background = "white") 



#W
set.seed(909)
scene_bubbles(n = 3) %>% unfold_loop(points = 20, radius = 8) %>%
  style_ribbon(palette = palette_named("bilbao"), background = "white") 



# scene bubbles > unfold_temp 
scene_bubbles(n = 9, grain = 50) %>%
  unfold_tempest(iterations = 20,  scale = 0.005) %>%
  style_ribbon(
    palette_named("devon"), background = "white", type = "curve")


# scene_bubbles > unfold_slice 
scene_bubbles(n = 10, grain = 29) %>%
  unfold_slice(iterations = 14,scale = .6) %>%
  style_ribbon(
    palette_named("devon"), background = "white")


# scene_bubbles > unfoldbreeze 
scene_bubbles(n = 1500, grain = 29) %>%
  unfold_breeze(iterations = 19,drift = .01,octaves = 1,output = "time") %>%
  style_ribbon(
    palette_named("devon"), background = "white")

#Arr
for(oct in 1:10)
  use_seed(988) %>%
    entity_circle(200, size = 3) %>%
    unfold_breeze(10, .001) %>% 
    style_ribbon(
      palette_named("bilbao"), background = "white") 

#
for(oct in 1:10)
  use_seed(988) %>%
  entity_circle(200, size = 3, grain = 10) %>%
  unfold_tempest(iterations = 200,  scale = .0015) %>%
  dplyr::mutate(order = order + ((id - 3) * 100)) %>% 
  style_ribbon(
    palette_named("devon"), background = "white") 



# same as above but using scene_delaunay
scene_delaunay(seed = use_seed(1), n = 100, grain = 9) %>%
  unfold_slice(iterations = 9,scale = .6) %>%
  style_ribbon(
    palette_named("devon"), background = "white")



#
scene_bubbles(n = 100) %>%
  unfold_tempest(iterations = 200, scale = 0.95) %>%
  style_ribbon(
    alpha = c(0.3,.005),
    discard = 50,
    palette_named("devon"), background = "white")


## s bubbles > unfold_temp > dplyr mutate
set.seed(10)
scene_bubbles(n = 3, grain = 90) %>%
  unfold_tempest(iterations = 200,  scale = .0025) %>%
  dplyr::mutate(order = order + ((id - 3) * 1000)) %>%
  style_ribbon(
    alpha = c(0.21,.01),
    palette_named("devon"),background = "white")


# use_seed > entity circ > unfold_wrap > unfold_temp 
use_seed(909)%>% entity_circle(grain = 10) %>% unfold_tempest(iterations = 200,scale = .01) %>% style_ribbon(palette = palette_named("devon"),colour = "ind",alpha = c(.4,89),background = "white")
scene_bubbles(n = 90, grain = 100) %>%
  unfold_tempest(iterations = 500, scale = 0.02,output1 = "time",output2 = "order") %>%
  style_ribbon(
    palette = palette_named("devon"),background = "black",discard = 30,alpha = c(1, 0.0015)
  )




# use_seed > unfold_wrap > unfold temp >
use_seed(9) %>%
  scene_discs(
    rings = 3, points = 500, size = 10
  ) %>%
  unfold_warp(
    iterations = 10,
    scale = .9, 
    output = "layer" 
  ) %>%
  unfold_tempest(iterations = 20,scale = .01) %>%
  style_ribbon(
    palette = palette_named("devon"),
    colour = "ind",
    alpha = c(.4,8),
    background = "white", type = "curve"
  ) 

#
use_seed(9) %>%
  entity_circle(grain = 200) %>%
  unfold_slice(iterations = 100) %>%
  style_ribbon(
    palette = palette_named("devon"), 
    colour = "ind", 
    background = "white") %>%
  style_overlay(border = "black")
  


# seed 405, circ, unfold slice, unfold warp, oslo
use_seed(405) %>%
  entity_circle(grain = 1000) %>%
  unfold_slice(iterations = 17) %>%
  unfold_warp(
    iterations = 9,
    scale = .7, 
    output = "time" 
  ) %>%
  style_ribbon(discard = .1,  palette = palette_named("devon"), background = "white")


# seed 405, circ, unfold slice, unfold warp, oslo
use_seed(999) %>%
  entity_circle(grain = 800) %>%
  unfold_slice(iterations = 18) %>%
  unfold_warp(
    iterations = 3,
    scale = .7, 
    output = "time" 
  ) %>%
  style_ribbon(discard = .1,  palette = palette_named("devon"), background = "white")




# diff colour + settings
use_seed(999) %>%
  entity_circle(grain = 1000) %>%
  unfold_slice(iterations = 17) %>%
  unfold_warp(
    iterations = 5,
    scale = .7, 
    output = "time" 
  )%>% style_ribbon(discard = .1,  palette = palette_named("devon"),background = "white")


#
use_seed(2244) %>%
  scene_bubbles(n = 109)%>%
  unfold_warp(
    iterations = 1,
    scale = .6, 
    output = "time" 
  ) %>%
  style_ribbon(discard = .9,
    palette = palette_named("devon"),
    colour = "white",
    alpha = c(.24,2),
    background = #cdc7d9, type = "curve" ) 

# %>%
#   style_overlay(border = "black", fill = NULL, linewidth = .1 )


#
  scene_bubbles(n = 9) %>%
  unfold_tempest(iterations = 5) %>%
  style_ribbon(burnin = 4,palette = palette_named("devon"), background = "white")

