# function to attach a value for gene type and gene Cluster
# x is the name of the dataframe
# i is the column of the dataframe that hols the name of the gene, from which selection is made
mergedf<-function(x, i){
# x Genes
x$geneType<-vector(mode="character", length=length(x[,1]))
x$geneType[which(x[,i] %in% ssdgenes)]<-"SSD"
x$geneType[which(x[,i] %in% wgdgenes)]<-"WGD"
x$geneType[which(x[,i] %in% singletongenes)]<-"singletons"
x$geneType[which(x$geneType=="")]<-"singletons"
# x Gene Clusters
x$geneClusterType<-vector(mode="character", length=length(x[,1]))
#
x$geneClusterType[which(x[,i] %in% ssdgenesINssdClust)]<-"SSD_in_SSDCluster"
x$geneClusterType[which(x[,i] %in% ssdgenesINwgdClust)]<-"SSD_in_WGDCluster"
#
x$geneClusterType[which(x[,i] %in% wgdgenesINwgdClust)]<-"WGD_in_WGDCluster"
x$geneClusterType[which(x[,i] %in% wgdgenesINssdClust)]<-"WGD_in_SSDCluster"
#
x$geneClusterType[which(x[,i] %in% singletonsINssdClust)]<-"Singletons_in_SSDCluster"
x$geneClusterType[which(x[,i] %in% singletonsINwgdClust)]<-"Singletons_in_WGDCluster"
x$geneClusterType[which(x[,i] %in% singletonsINcomplementClust)]<-"Singletons_in_ComplementCluster"
x$geneClusterType[which(x$geneClusterType=="")]<-"Singletons_in_ComplementCluster"
#
x$geneType<-factor(x$geneType, levels=c("SSD", "WGD", "singletons"))
x$geneClusterType<-factor(x$geneClusterType, levels=c("SSD_in_SSDCluster", "SSD_in_WGDCluster", "WGD_in_SSDCluster", "WGD_in_WGDCluster", "Singletons_in_SSDCluster", "Singletons_in_WGDCluster", "Singletons_in_ComplementCluster"))
return(x)
}
