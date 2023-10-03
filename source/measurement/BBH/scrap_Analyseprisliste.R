require(tesseract)
require(pdftools)
p_pdf = "https://www.bispebjerghospital.dk/afdelinger-og-klinikker/klinisk-biokemisk-afdeling/for-sundhedsfaglige/Documents/Analyseprisliste%202023%20V2.pdf"
temp_pdf_data <- pdftools::pdf_ocr_text(p_pdf)
str(temp_pdf_data)

df_pdf_data <- data.frame(ID = 1:length(temp_pdf_data),
                          page = 1:length(temp_pdf_data),
                          pdf_ocr_data = temp_pdf_data)

df_pdf_data$nchar <- nchar(df_pdf_data$pdf_ocr_data)

v_pdf_page        <- c()
v_pdf_page_line   <- c()
for ( i in 1:nrow(df_pdf_data) ){
  v_temp <- unlist(strsplit(df_pdf_data$pdf_ocr_data[i], split ="\n"))
  v_pdf_page        <- c(v_pdf_page, rep(i, length(v_temp)))
  v_pdf_page_line   <- c(v_pdf_page_line, v_temp)
}
str(v_pdf_page)
str(v_pdf_page_line)

df_pdf_data_line <- data.frame(ID = 1:length(v_pdf_page_line)
                               , pdf_page = v_pdf_page
                               , pdf_page_line = v_pdf_page_line)

v_unq_pdf_data_line <- unique(df_pdf_data_line$pdf_page_line)

df_unq_pdf_data_line <- data.frame(ID = 1:length(v_unq_pdf_data_line)
                                   , unq_pdf_data_line = v_unq_pdf_data_line)
df_unq_pdf_data_line$n_instance <- NA

for ( i in 1:nrow(df_unq_pdf_data_line) ){
   temp_ID <- df_unq_pdf_data_line$ID[i]
   temp_unq_pdf_data_line <- df_unq_pdf_data_line$unq_pdf_data_line[i]
   temp_n_instance <- nrow(df_pdf_data_line[ df_pdf_data_line$pdf_page_line == temp_unq_pdf_data_line, ])
   df_unq_pdf_data_line$n_instance[df_unq_pdf_data_line$ID == temp_ID] <- temp_n_instance 
}

df_pdf_data_line$IS_ANALYSIS_LINE <- NA
df_pdf_data_line$IS_ANALYSIS_LINE[grepl("kr", df_pdf_data_line$pdf_page_line)] <- 1
df_pdf_data_line$IS_ANALYSIS_LINE[!grepl("kr", df_pdf_data_line$pdf_page_line)] <- 0

df_pdf_data_line$Analysekode <- NA
df_pdf_data_line$Analysenavn <- NA
df_pdf_data_line$Analyser_i_beregningen <- NA
df_pdf_data_line$PRIS_2023 <- NA

for ( i in 1:nrow(df_pdf_data_line) ){
   temp_ID               <- df_pdf_data_line$ID[i]
   temp_IS_ANALYSIS_LINE <- df_pdf_data_line$IS_ANALYSIS_LINE[i]
   if(temp_IS_ANALYSIS_LINE == 1) {
      temp_pdf_page_line <- df_pdf_data_line$pdf_page_line[i]
      v_temp <- unlist(strsplit(temp_pdf_page_line, split=" "))
      temp_Analysekode <- v_temp[1]
      df_pdf_data_line$Analysekode[df_pdf_data_line$ID == temp_ID] <- temp_Analysekode
   }
}


df_Prisliste_Analyse <- df_pdf_data_line[df_pdf_data_line$IS_ANALYSIS_LINE == 1 , ]
df_Prisliste_Analyse$INCLUDE_CONDITION <- NA
df_Prisliste_Analyse$INCLUDE_CONDITION[grepl("(kr.)$", df_Prisliste_Analyse$pdf_page_line)] <- 0
df_Prisliste_Analyse$INCLUDE_CONDITION[!grepl("(kr.)$", df_Prisliste_Analyse$pdf_page_line)] <- 1
