install.packages("tm")
install.packages("wordcloud")
install.packages("RColorBrewer")


library(tm)
library(wordcloud)
library(RColorBrewer)

text_file ="C:\\Users\\raj\\Downloads\\v74i07.txt"
textfile=readLines(text_file)

file1<-Corpus(VectorSource(textfile))

file2<-tm_map(file1,stripWhitespace)

file2<-tm_map(file2,tolower)

file2<-tm_map(file2,removeNumbers)

file2<-tm_map(file2,removePunctuation)

file2<-tm_map(file2,removeWords, stopwords("english"))

file2<-tm_map(file2,removeWords, c("and","the","for","are","can","also","with"))
tdm_file2<-TermDocumentMatrix (file2)

TDM1<-as.matrix(tdm_file2) #Convert this into a matrix format

v = sort(rowSums(TDM1), decreasing = TRUE) #Gives you the frequencies for every word

summary(v)
str(names(v), v)

wordcloud(names(v), v, scale=c(5,0.5), max.words=100, colors=brewer.pal(3,"Dark2"))
