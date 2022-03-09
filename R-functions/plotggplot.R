plotggplot<-function(df, variable, comparison, plottitle, boxplot=T, labs=c(main, x, y), comps){
  if (class(comps) != "list"){
  if (comparison == "geneType"){
    my_comparisons <- list(c("SSD", "WGD"), c("SSD", "singletons"), c("WGD", "singletons"))
  }
  if (comparison == "geneClusterType"){
  my_comparisons <- list(c("SSD_in_SSDCluster", "SSD_in_WGDCluster"), c("WGD_in_SSDCluster", "WGD_in_WGDCluster"), c("Singletons_in_SSDCluster", "Singletons_in_WGDCluster"), c("Singletons_in_SSDCluster", "Singletons_in_ComplementCluster"), c("Singletons_in_WGDCluster", "Singletons_in_ComplementCluster"))
  }
  }
  if (class(comps) == "list"){
    my_comparisons = comps
  }
  if (boxplot == T){
  bplot<-ggboxplot(df, x = comparison, y = variable, fill = "geneType", title=plottitle, palette = c("firebrick4",  "olivedrab", "steelblue4")) + stat_compare_means(comparisons = my_comparisons) + coord_flip() + labs(title=labs[1], x=labs[2], y=labs[3])
  }
  if (boxplot == F){
  bplot<-ggviolin(df, x = comparison, y = variable, fill = "geneType", title=plottitle, palette = c("firebrick4",  "olivedrab", "steelblue4")) + stat_compare_means(comparisons = my_comparisons) + coord_flip() + labs(title=labs[1], x=labs[2], y=labs[3])
  }
return(bplot)
}