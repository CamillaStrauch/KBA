##----------------------------------------------------------------------------------
##  Version     : 1.0
##  Created by  : HSTR0041 
##  Create date : 2020-03-18
##  
##  Modified by : 
##  Modify date :  
##
##  Purpose:
##  ------------
##  This purpose of this script is to fetch geojson data from DAWA for a specific DAGI type
##  and store it locally
##
##  DAGI is an abbreviation for: 
##  Danmarks Administrative Geografiske Inddeling
##  (Denmark's Administrative Geographical Division)
##  
##  Arguments:
##  ------------
##  1) The DAGI type given by an integer 
##    (default 6: postnumre)
##  2) The local folder in which the files should be stored - forward slashes 
##    (default current folder + DAWA/<DAGI_type>
##  3) The file prefix 
##
##  The DAGI type is given as an input argument.
##  Following area types are allowed: 
##  1 : "afstemningsomraader"
##  2 : "kommuner"
##  3 : "landsdele"
##  4 : "opstillingskredse"
##  5 : "politikredse"
##  6 : "postnumre"
##  7 : "regioner"
##  8 : "retskredse"
##  9 : "sogne"
##  10: "storkredse"
##  11: "valglandsdele"
##  
##  !!! supplerendebynavne2 has been omitted
## 
##-----------------------------------------------------------------------------------
require("geojsonio")
require("rjson")

DAWA_DAGI_type <- c("afstemningsomraader" # 1
                  ,"kommuner"             #2
                  ,"landsdele"            #3
                  ,"opstillingskredse"    #4
                  ,"politikredse"         #5
                  ,"postnumre"            #6
                  ,"regioner"             #7
                  ,"retskredse"           #8
                  ,"sogne"                #9
                  ,"storkredse"           #10
                  ,"valglandsdele"        #11
                  )

DAWA_DAGI_prefix <- c("DAWA_afstemningsomraade_" #1
                      ,"DAWA_kommune_"           #2
                      ,"DAWA_landsdel_"          #3
                      ,"DAWA_opstillingskreds_"  #4
                      ,"DAWA_politikreds_"       #5
                      ,"DAWA_postnummer_"        #6   
                      ,"DAWA_region_"            #7
                      ,"DAWA_retskreds_"         #8
                      ,"DAWA_sogn_"              #9
                      ,"DAWA_storkreds_"         #10
                      ,"DAWA_valglandsdel_"       #11
                  )

v_current_folder <- getwd()

if (length(args)==0) {
  # Set default values
    p_chosen_DAGI_type <- 6
    p_prefix           <- DAWA_DAGI_prefix[p_chosen_DAGI_type] 
  # p_folder           <- paste(v_current_folder, DAWA_DAGI_type[p_chosen_DAGI_type], sep="/DAWA_")
    p_folder           <- v_current_folder
    p_prefix           <- DAWA_DAGI_prefix[p_chosen_DAGI_type] 
} else if (length(args) > 0) {
  # test that a proper DAGI_type is chosen
    p_chosen_DAGI_type <- as.integer(args[1])
    p_folder           <- v_current_folder
    p_prefix           <- DAWA_DAGI_prefix[p_chosen_DAGI_type] 
}

v_DAGI_type                      <- DAWA_DAGI_type[p_chosen_DAGI_type]
p_DAWA_website                   <- "http://dawa.aws.dk"
v_list_dk_DAGI_type_DAWA_csv_url <- paste0(paste(p_DAWA_website, v_DAGI_type, sep="/", "?format=csv")
v_list_dk_DAGI_type_DAWA_csv_file<- paste0(paste0(paste0(v_current_folder,"/DAWA_"), v_DAGI_type),".csv") 



download.file(url=v_list_dk_DAGI_type_DAWA_csv_url, v_list_dk_DAGI_type_DAWA_csv_file)

df_list_dk_DAGI_type_DAWA_csv <- read.csv(file=v_list_dk_DAGI_type_DAWA_csv_file, encoding="UTF-8", stringsAsFactors=FALSE)
n_list_dk_DAGI_type_DAWA_csv  <- nrow(df_list_dk_DAGI_type_DAWA_csv)

sp_all <-c()
for (i in 1:n_list_dk_DAGI_type_DAWA_csv){
  #temp_DAWA_geojson_URL
  #temp_lokal_geojson_file
  #temp_sp_rds_file         
  #download.file(url=temp_DAWA_geojson_URL, destfile=temp_lokal_geojson_file)
  #temp_sp  <- geojsonio::geojson_read(temp_lokal_geojson_file, what = "sp")
  #   saveRDS(temp_sp, file = temp_sp_rds_file)
  #   if( i == 1){
  #       sp_all                   <- temp_sp
  #
  #   }         
  #   if( i > 1){
  #       sp_all                   <- rbind(sp_all, temp_sp)
  #
  #   }         
  #   if( i == 1){
  #       sp_all                   <- temp_sp
  #
  #   }         
  #   if( i > 1){
  #       sp_all                   <- rbind(sp_all, temp_sp)
  #
  #   }         
  print(i)
}
