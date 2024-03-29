#Data Structures in R

#vectors----
v1=10
v1
print(v1)
v2=1:100
v2
(v3=c(1,6,4,10))  #create and print
v4=seq(1,100,5)
v4
v5=c('A','Harshita',"IIFT")
v5
class(v5)
(v6=1:100000)
(v7=rnorm(100,mean=60,sd=10))
mean(v7)
sd(v7)
v7
v7[1:10]
v7[seq(1,100,2)]
v7[v7>50]
v7[v7>50 & v7<60]
v7[v7>50 | v7>60]
mean(v7[v7>70|v7<60])
plot(v7)
hist(v7)
plot(density(v7))
hist(v7,breaks=10)
quantile(v7)
summary(v7)
quantile(v7,seq(0,1,0.1))
quantile(v7,seq(0,1,.01))
sort(v7)
sort(v7,decreasing=TRUE)
#matrix----
(data=24:1)
v12=c('1','3','a')
v12
v13=1:10
v13
v13/sum(v13)
data
m1=matrix(data)
m1
(m2= matrix(data,nrow=4))
(m2= matrix(data,nrow=4, byrow=T)) #decreasing order
?matrix
m2[1,]
m2[,1]
m2[,c(1,3)]
m2[c(2,4), c(2,4,5)]
m2
rowSums(m2)
colSums(m2)
rowMeans(m2)
colMeans(m2)
m2
table(mtcars$cyl)
t1 = table(mtcars$cyl,mtcars$gear,dnn=c('cyl','gear'))
t1
margin.table(t1)
margin.table(t1,margin=1)
margin.table(t1,margin=2)
addmargins(t1)
addmargins(t1, FUN=mean)
addmargins(t1, FUN=list(list(mean,sum,sd,var), list(sd,var,sum,mean)))

sweep(m2,MARGIN=1,STATS=4,FUN='+')
m2
sweep(m2,MARGIN=1,STATS=c(1,2,3,4),FUN='+')
m2
sweep(m2,MARGIN=1,STATS=c(1,2,3,4),FUN='*')
m2
sweep(m2,MARGIN=2,STATS=c(1,2,3,4,5,6),FUN='*')
m2

?addmargins
?margin.table

#dataframe----
mtcars
data()
AirPassengers 
class(mtcars)
head(mtcars, n=3)
tail(mtcars)
dim(mtcars) #dimensions
nrow(mtcars) #number of rows
names(mtcars) #names of columns
rownames(mtcars) #row names
summary(mtcars)

#summarising / filter data from DF
mtcars[mtcars$gear==4,]
mtcars[mtcars$gear==4 & mtcars$mpg<25, c('mpg','gear','cyl') ]
mtcars
mtcars[ order(mtcars$mpg), ]
head(mtcars)
mtcars[ row.names(mtcars)=='Mazda RX4', ]
mtcars[c(1,3,4), c(1,5)]

#export to csv
mtcars
write.csv(mtcars, 'harshita.csv')
df1 = read.csv('harshita.csv')
head (df1)
length(names(df1))
ncol(df1)
write.csv(mtcars, 'harshita1.csv',row.names=F)
df2= read.csv('harshita1.csv')
head(df2)
(carnames=paste('car',1:32,sep='-'))
df2$cars=carnames
head(df2)

#create dataframe 
#rollno, name, gender, marks, grade
(rollno=1:30)
(name = paste('student',1:30))
rep('M',3)   #repeat function for gender allocation
rep(c('M','F'),c(4,3))

set.seed(123)
(gender=sample(c('M','F'), size=30, replace=T)) #random function for gender allocation
(gender=sample(c('M','F'), size=30, replace=T,prob=c(.6,.4)))
table(gender)
#above three lines are run together to get the same values for gender distribution every time
prop.table(table(gender))
table(gender)

(marks=runif(30,min=50, max=100))
x=c(-14.45,-14.67,14.45,14.67)
x
trunc(x)  #removes decimal
round(x,1) #round off to 1 ddecimal place
floor(x) #lowest limit
ceiling(x) #upper limit

(grades = sample(c('A','B','c'), size=30, replace=T, prob=c(.3,.45,.25)))
table(grades)
prop.table(table(grades))


rollno ; name ; gender ; marks ; grades
students=data.frame(rollno, name, gender, marks, grades)
head(students)
str(students)
summary(students)
students$grades= factor(students$grades, ordered=T)
students$grades
students$grades= factor(students$grades, ordered='T', levels=c('C','B','A'))
students$grades
table(students$grades)
barplot(table(students$grades), col=1:3)
hist(students$marks)
range(students$marks)
hist(students$marks, breaks=c(0,70,90,100))

#M, M>70
students
students[students$gender =='M' & students$marks >70,]


library(dplyr)
#install.packages(dplyr)

students %>% filter(gender =='M' & marks >70) %>% arrange(marks) %>% head(n=3) %>% select(rollno, name)

v9 = c(1L, 5L)
class(v9)
v10 = c(1, 10)
class(v10)
?seq
seq(.1,.1)
