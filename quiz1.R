# carregar dados CSV para data frame
ledados <- function(){
  data <- read.csv("hw1_data.csv")
  data
}
# encontrar valor no data frame
diversas <- function(data){
  print("as duas primeiras linhas")
  d<- data[1:2,] 
  print(d)
  
  print("as duas últimas linhas")
  d<- data[(nrow(data)-1):nrow(data), ] 
  print(d)
  
  print("quantizando valores NA em Ozone")
  d<- table(factor(is.na(data[,"Ozone"])))
  print(d)
  
  print("média de valores válidos na coluna Ozone")
  good <- complete.cases(data[,"Ozone"])
  ozone <- data[,"Ozone"]
  d<- mean(ozone[good])
  print(d)
  
  print("Média de Solar.R quando Ozone >31 e Temp >90")
  data2<-subset.data.frame(data,Ozone>31 & Temp>90, select = c(Solar.R))
  d<- mean(data2$Solar.R)
  print(d)
  ## ou apenas
  d<- mean(subset.data.frame(data,Ozone>31 & Temp>90)$Solar.R)
  print(d)
  
  print("Média de temperatura no mês 6 - junho")
  d<- mean(subset(data, Month == 6)$Temp)
  print(d)
  print("O Máximo do Ozonio no mês 5 - maio")
  d<- max(subset(data, Month == 5& Ozone>0)$Ozone)
  print(d)
}

