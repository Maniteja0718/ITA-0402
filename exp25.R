exam_data=data.frame(
name=c("Dima","James","Emily","Mike","John")
score=c(12.5,9,16.5,12,9)
attempts=c(1,3,2,3,2)
qualify=c('yes','no','yes','yes','no')

selected_data<-exam_data[c(3,5),c(1,3)]
print(selected_data)

country<-("USA","USA","USA","USA","UK")
exam_data$country<-country
print(exam_data)

new_exam_data<-data.frame(
name=c('Robert')
score=c(10.5)
attempts=c(1)
qualify=('yes')
country=c('USA')
combined_data<-rbin(exam_data,new_exam_data)
print(combined_data)

sorted_exam_data<-exam_data[order(exam_data$name,exam_data$score),]

data<-read.csv("/Users/aditya/Documents/exam_data.csv")
print(data)