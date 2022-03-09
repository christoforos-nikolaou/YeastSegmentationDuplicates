listenrichment<-function(space, list1, list2, npermutations){
  spacesize<-length(space)
  rate1<-length(list1)/length(space)
  rate2<-length(list2)/length(space)
  expected<-rate1*rate2
  observed<-length(intersect(list1, list2))/length(space)
  enrichment<-observed/expected
  # permutations
  n = 0
  for (i in 1:npermutations){
    randomsample<-sample(space, length(list1), replace=F)
    robserved<-length(intersect(randomsample, list2))/length(space)
    renr<-robserved/expected
    if (renr>enrichment){
      n = n + 1
    }
  }
  if (n/npermutations<0.5) {p<-n/npermutations}
  if (n/npermutations>=0.5) {p<-(npermutations-n)/npermutations}
  return(list(enrichment, p))
}
