#Function to plot chromosomes
yeast.genome.plot<-function(chromosomes, data, dataname, color1, color2)
{
#load data like this
#chromosomes<-read.table("~/Dropbox/Data/yeast_interactions_noble/saccer2_R.genome")[,1:4]
#data<-read.table("/home/christoforos/Datasets/gencoords/hg18_refseq_genes_short.bed")[,1:3]
chrom<-as.matrix(chromosomes)
sites<-as.data.frame(data)
title<-as.character(dataname)
par(mar=c(3,3,3,3))
margin<-250;
width<-50;
offset<-25;
x<-seq(1,margin);
y<-seq(1,width,by=width/margin);
y<-c(y,1,1,1,1);
scale<-7500;
plot(x, y, type="n", xlab="", ylab="", axes=F, main=title, cex.main=1.6); #plotting an empty frame
#color coding
values=sites[,4];
#quantile(-log(values)/log(10), probs=seq(0,1,by=0.5))->quants
quantile(values, probs=seq(0,1,by=0.5))->quants
#quants<-levels(as.factor(sites[,4]))
#cols<-rainbow(length(quants))
#cols<-colorRampPalette(c(color1, color2))(length(quants))
cols<-c(color1, color2)
colors<-0;
# logspace
#for(k in 1:length(quants)){which(-log(sites[,4])/log(10)>=quants[k] & -log(sites[,4])/log(10)<=quants[k+1])->ind; colors[ind]<-cols[k]}
# normal space
for(k in 1:length(quants)){which(sites[,4]>=quants[k] & sites[,4]<=quants[k+1])->ind; colors[ind]<-cols[k]}
# extreme values
#for(k in 1:length(quants)){which(sites[,4]==quants[k])->ind; colors[ind]<-cols[k]}
for(i in 1:length(chrom[,1])){
  name<-chrom[i,2];
  size<-as.numeric(chrom[i,3])/scale;
  cent<-as.numeric(chrom[i,4])/scale;
  coord1<-width-1-3*i;
  coord2<-width-3*i;
  rect(offset, coord1+1.3, size+offset, coord2-1.3, col="grey", border=F);
  segments(cent+offset,coord1+1.6-0.2,cent+offset,coord2-1.6+0.2, lwd=3, col="black");
  text(10, coord1+0.75, labels=name, cex=1.1);
  subset<-which(sites[,1]==name);
#  positions<-(as.numeric(sites[subset,2])+as.numeric(sites[subset,3]))/2
#  positions<-positions/scale
	pos1<-(as.numeric(sites[subset,2]));
	pos2<-(as.numeric(sites[subset,3]));
	pos3<-ceiling((pos1+pos2)/2);
	pos1<-pos1/scale;
	pos2<-pos2/scale;
	pos3<-pos3/scale;
	cols<-colors[subset]
	if(length(pos1)>0){
    for (j in 1:length(pos1)) {
#	  rect(pos3[j]+offset, coord1+1, pos3[j]+offset, coord2-0.5, col="black", border="black", lwd=3)
	  rect(pos1[j]+offset, coord1+1.3, pos2[j]+offset, coord2-1.3, col=cols[j], border=cols[j])
	}
    }
  }
}
