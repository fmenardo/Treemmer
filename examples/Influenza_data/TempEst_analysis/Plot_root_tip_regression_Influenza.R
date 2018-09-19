# plot root-tip regression for several trees (Influenza dataset)
#the original tree has 2063 leaves                                MRCA = 2010.9206    slope = 0.0027564
#the 0.99 tree has 1729 leaves  83.8% of original n of leaves     MRCA = 2010.8562    slope = 0.0027231
#the 0.9 tree has 1245 leaves  60.3% of original n of leaves      MRCA = 2010.7542    slope = 0.0026904
#the 0.75 tree has 844 leaves 40.9% of original leaves            MRCA = 2010.6383    slope = 0.0026286
#the 0.5 tree has 430 leaves 20.8% of original n of leaves        MRCA = 2010.6808    slope = 0.0027299

library(ggplot2)


ROOT1 = read.table("root_to_tip_1",head=T)
ROOT0.99 = read.table("root_to_tip_0.99",head=T)
ROOT0.9 = read.table("root_to_tip_0.9",head=T)
ROOT0.75 = read.table("root_to_tip_0.75",head=T)
ROOT0.5 = read.table("root_to_tip_0.5",head=T)

pdf("root_tip_regr.pdf")

ggplot(ROOT1,aes(x=date,y=distance)) + xlab("Time") + ylab("Distance from root") + 
  scale_y_continuous(expand = c(0, 0)) +
  theme(panel.background = element_rect(fill='white', colour='black')) +
  scale_x_continuous(limits = c(2009, 2018)) +coord_cartesian(ylim = c(0, 0.03))+
    geom_point(color='black', size = 2)+ 
stat_smooth(method=lm, color ='black' ,fullrange = T,size = 0.3,level=0.99,fill='gray15')+
    stat_smooth(method=lm,data=ROOT0.9, size = 0.3, aes(x=date,y=distance), color ='red',se=F, fullrange = T ) +
  stat_smooth(method=lm,data=ROOT0.75, size = 0.3, aes(x=date,y=distance), color ='green',se=F, fullrange = T ) +
stat_smooth(method=lm,data=ROOT0.5, size = 0.3, aes(x=date,y=distance), color ='blue',se=F, fullrange = T ) +
  stat_smooth(method=lm,data=ROOT0.99, size = 0.3, aes(x=date,y=distance), color ='orange',se=F, fullrange = T )
dev.off()
