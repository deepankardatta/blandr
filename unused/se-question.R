library(blandr)
library(ggplot2)

A = method1
B = method2
statistics.results <-blandr.statistics(A,B)
# blandr.display(A,B,sig.level = 0.95)
summary(statistics.results)

blandr.ggplot(statistics.results)+ggtitle("A raw water") +
  xlab("Mean of two measures (Abs/m)")+ ylab("Difference of two measures (Abs/m)") +
  xlim(0,75) + scale_y_continuous(limits=c(-1,1))+ geom_point(color = "Blue") +
  theme(axis.text=element_text(size=14), axis.title =element_text(size=14,face="bold"), plot.title = element_text(size = 14,face = "bold")) +
  theme(axis.line=element_line(size = 1,color = "black"))+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())



plot(statistics.results)
ggplot(statistics.results)
plot.output<-ggplot(statistics.results)

plot.output.2 <- plot.output + ggtitle("A raw water") +
  xlab("Mean of two measures (Abs/m)")+ ylab("Difference of two measures (Abs/m)") +
  xlim(0,75) + scale_y_continuous(limits=c(-1,1))+ geom_point(color = "Blue") +
  theme(axis.text=element_text(size=14), axis.title =element_text(size=14,face="bold"), plot.title = element_text(size = 14,face = "bold")) +
  theme(axis.line=element_line(size = 1,color = "black"))+
  theme(panel.grid.major=element_blank(),panel.grid.minor = element_blank(),panel.background = element_blank())

plot.output.2 + geom_label(aes(x=70, y=-0.1, label="test"))
