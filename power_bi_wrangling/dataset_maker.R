library(dplyr)
library(tidyr)
library(ggplot2)
library(plotly)

collisions <- read.csv("collisions_new.csv",stringsAsFactors = FALSE)
collisions <- collisions %>% select(-OBJECTID, -EXCEPTRSNCODE, -EXCEPTRSNDESC, -COLDETKEY)

old_names<-colnames(collisions)

names(collisions) <- c("collision_long",
                       "collision_lat",
                       "collision_incident_key",
                       "collision_report_no", 
                       "collision_status",          
                       "collision_address_type",
                       "collision_intersection_key",
                       "collision_address",
                       "collision_severity_code",
                       "collision_severity_description",   
                       "collision_type", 
                       "collision_person_count",
                       "collision_pedestrian_count",
                       "collision_bicycle_count",
                       "collision_vehicle_count",
                       "collision_total_injuries",
                       "collision_total_serious_injuries",
                       "collision_fatalities",
                       "collision_incident_date",
                       "collision_incident_time",
                       "collision_junction_type",
                       "collision_sdot_col_code",
                       "collision_sdot_col_desc",
                       "collision_due_to_inattention",
                       "collision_under_influence_of_drugs_alcohol",
                       "collision_weather_conditions", 
                       "collision_road_conditions", 
                       "collision_light_conditions",
                       "collision_pedestrian_right_of_way", 
                       "collision_sdot_colnum",
                       "collision_speeding_factor_in_collision",
                       "collision_st_collision_code",
                       "collision_description",
                       "collision_lane_segment_key",
                       "collision_crosswalk_key",
                       "collision_hit_parked_car")

collisions <- collisions %>% mutate(record_type = "Collision")
intersections <- read.csv("Intersections.csv",stringsAsFactors = FALSE)

collisions <- read.csv("seattle_collisions_time.csv",stringsAsFactors = FALSE)

View(intersections)


View(collisions)

df <- collisions %>% group_by(collision_address, collision_address_type) %>% summarise(total_accidents = n())
df2 <- collisions %>% group_by(collision_address, collision_address_type, collision_junction_type) %>% summarise(total_accidents = n())

View(df)




write.csv(df2, file = "collisions_address_junction.csv")

###################################################################################

traffic_signals <- read.csv("Traffic_Signals.csv",stringsAsFactors = FALSE)

traffic_signals <- traffic_signals %>%  mutate(record_type = "Traffic_Signals")

traffic_signals <- traffic_signals %>% select(COMPKEY, UNITID, UNITDESC, SIGNAL_TYPE, OWNERSHIP, CONDITION, 
                                              CURRENT_STATUS, ARTERIAL_CLASS, INT_SIGNAL_TYPE_CD, PEDAUDIODEVICEYN, 
                                              PEDSIGNALYN, LTTURNSIGNALYN, LTPROTECTEDPERMYN, LTPROTECTEDYN, RTTURNSIGNALYN, 
                                              RTPROTECTEDPERMYN, RTPROTECTEDYN, PH_MODELTYPE, PP_MODELTYPE,MMUMODELTYPECD, 
                                              PRIMARYDISTRICTCD, COMCONNTYPECD, record_type)
View(traffic_signals)

c("signal_key", "signal_id", "signal_address", "signal_type", "signal_owner", "signal_condition", 
  COMPKEY, UNITID, UNITDESC, SIGNAL_TYPE, OWNERSHIP, CONDITION, 
  CURRENT_STATUS, ARTERIAL_CLASS, INT_SIGNAL_TYPE_CD, PEDAUDIODEVICEYN, 
  PEDSIGNALYN, LTTURNSIGNALYN, LTPROTECTEDPERMYN, LTPROTECTEDYN, RTTURNSIGNALYN, 
  RTPROTECTEDPERMYN, RTPROTECTEDYN, PH_MODELTYPE, PP_MODELTYPE,MMUMODELTYPECD, 
  PRIMARYDISTRICTCD, COMCONNTYPECD, record_type)






########################################################
library(dplyr)
collisions <- read.csv("seattle_collisions_weather.csv",stringsAsFactors = FALSE)

colnames(collisions)
df2 <- collisions %>% group_by(weekofyear, year, collision_type) %>% summarise(total_accidents = n())
df3 <- df2 %>% group_by(weekofyear, collision_type) %>% summarise(avg_collisions = mean(total_accidents), var_collisions = var(total_accidents))
df3 <- df2 %>% group_by(collision_type) %>% summarise(avg_collisions = mean(total_accidents), sd_collisions = sd (total_accidents), sd_2 = sd_collisions*2, max_c = max(total_collisions), min_c = min(total_collisions), difference = max_c-min_c)
df <- collisions %>% group_by(collision_address, collision_address_type, year) %>% summarise(total_accidents = n())
df <- df %>% group_by(collision_address, year) %>% summarise(median_acc = mean(total_accidents))
df <- df %>% group_by(year) %>% summarise(mean_acc = mean(median_acc))


View(df)
