#plot 100 RTL decays and the RTL range at each iteration for TB and flu datasets

#################################################################################################3
#TB  I ran Treemmer 100 times with -r 100

table_TB = read.table("all_decay_TB_110",header=F)    #pasted the 100 LD files and I kept the first 110 iterations (lines)  only (some runs had 111 iterations)
pdf("TB_rand.pdf")

plot (x=table_TB[,2],y=table_TB[,1], xlim=c(max(table_TB[,2])+3,0),ylim=c(0,1.1),pch=16,cex=.2,xlab="Number of leaves",ylab="Relative tree length")
for (i in 1:100){
  points(x=table_TB[,i+1],y=table_TB[,i],pch=16,cex=0.2)
}
dev.off()



#calculate and plot range of RTL at each iteration

range_vec=c()


for (r in 1:nrow(table_TB)){
  vec=c()
  for (i in 1:200){
    if (i %% 2 ==1)(vec<-c(vec,table_TB[r,i]))  #read all RTL for iteration r from all runs (100 runs)
  }
  vec = vec[!is.na(vec)]
  range_vec <- c(range_vec,(max(vec)-min(vec)))
}

pdf("TB_range_random.pdf")
plot(range_vec,pch=16,cex=.8,ylab="RTL range",xlab="Iteration")

dev.off()

####both plots togheter
pdf("TB_random_decay_and_range.pdf")

par(mar=c(5, 4, 4, 5) + 0.1)
plot (x=table_TB[,2],y=table_TB[,1], xlim=c(max(table_TB[,2])+3,0),ylim=c(0,1.1),pch=16,cex=.2,xlab="Number of leaves",ylab="Relative tree length")
for (i in 1:100){
  points(x=table_TB[,i+1],y=table_TB[,i],pch=16,cex=0.2)
}

par(new=T)

plot(range_vec,pch=16,cex=.5,axes=F,col="red", ylab="",xlab="")
axis(side=4)
mtext("RTL range",side=4,line=3)

axis(side=3)
mtext("Iteration",side=3,line=3)

dev.off()


#########################################################################################
#flu I ran Treemmer 100 times with -r 10
par(mfrow=c(1,1))
table_flu= read.table("all_decay_flu_210",header=F) #pasted the 100 LD files and I kept the first 210 iterations (lines)  only (some runs had 211 iterations)

pdf("flu_rand.pdf")
plot (x=table_flu[,2],y=table_flu[,1], xlim=c(max(table_flu[,2])+3,0),ylim=c(0,1.1),pch=16,cex=.2,xlab="Number of leaves",ylab="Relative tree length")
for (i in 1:100){
  points(x=table_flu[,i+1],y=table_flu[,i],pch=16,cex=0.2)
}
dev.off()


#calculate and plot range of RTL at each iteration
range_vec=c()

for (r in 1:nrow(table_flu)){
  vec=c()
  for (i in 1:200){
    if (i %% 2 ==1)(vec<-c(vec,table_flu[r,i])) #read all RTL for iteration r from all runs (100 runs)
  }
  vec = vec[!is.na(vec)]
  range_vec <- c(range_vec,(max(vec)-min(vec)))
}

pdf("flu_range_random.pdf")

plot(range_vec,pch=16,cex=.8,ylab="RTL range",xlab="Iteration")

dev.off()


####both plots togheter
pdf("flu_random_decay_and_range.pdf")

par(mar=c(5, 4, 4, 5) + 0.1)
plot (x=table_flu[,2],y=table_flu[,1], xlim=c(max(table_flu[,2])+3,0),ylim=c(0,1.1),pch=16,cex=.2,xlab="Number of leaves",ylab="Relative tree length")
for (i in 1:100){
  points(x=table_flu[,i+1],y=table_flu[,i],pch=16,cex=0.2)
}

par(new=T)

plot(range_vec,pch=16,cex=.5,axes=F,col="red", ylab="",xlab="")
axis(side=4)
mtext("RTL range",side=4,line=3)

axis(side=3)
mtext("Iteration",side=3,line=3)

dev.off()

