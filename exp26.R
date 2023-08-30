data("air quality")
if(is.data.frame(airquality)){
cat("air quality is a dataframe \n")
}else{
cat("air quality is not a data frame \n")
}
ordered_airquality<-airquality[order(airquality$month,airquality$Day)]
filtered_airquality<-ordered.airquality[,!(names(ordered_airquality))%1n%c("solar.R','word"))]
print(filtered_airquality)