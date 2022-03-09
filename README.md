# Project Outline

This git hosts data, code and supplementary material for our study on Yeast Gene Duplicate Positional Preference.

["Distinct chromosomal niches in the genome of S. cerevisiae provide the background for genomic innovation and shape the fate of gene duplicates"](https://www.biorxiv.org/content/10.1101/2022.02.26.482092v2)

Athanasia Stavropoulou[1,2], Aimilios Tassios[1,2], Maria Kalyva[1], Michalis Georgoulopoulos[3], Nikolaos Vakirlis[2], Ioannis Iliopoulos[1] and Christoforos Nikolaou[2,3]*

[1] Medical School, University of Crete, Heraklion, 70013, Greece  
[2] Computational Genomics Group, Biomedical Sciences Research Center “Alexander Fleming”, Athens, 16672, Greece  
[3] Hellenic Open University, Patras, 26335, Greece  
[*] Correspondence: cnikolaou@fleming.gr  

## Summary 

In this work we explore the way genomic innovation may be promoted in particular regions of a eukaryotic genome, modulated by chromatin constraints and regulatory flexibility. Through the study of two types of gene duplicates (Small-scale, SSD and whole-genome, WGD) in various contexts including their relative position, size, expression, regulation sequence and structural constraints we describe a clear partitioning of a gene-dense unicellular eukaryote genome into regions with variable potential for genomic innovation through gene duplication. 
Our findings point towards an architectural segregation of function, regulation and evolvability in the yeast genome, which, buffered by chromatin, creates preferential "niches” for gene duplicates and thus more permissive environments for genomic innovation. 

## Datasets

1. Sequence coordinates obtained from UCSC (sacCer2, June 2008). The file contains chromosomal coordinates, with gene transcription start and termination sites, alongside standard gene names: [sacCer2_gene_coordinates.bed](files/sacCer2_gene_coordinates.bed)

2. Three dimensional coordinates of S. cerevisiae genes. For the three dimensional coordinates we used the published conformational model of the yeast genome [(Duan et al. 2010)](https://www.nature.com/articles/nature08973)⁠ which has been resampled at gene resolution.  We obtained gene positions by linearly interpolating the model’s control points to approximate the center base pair of each gene, which resulted in each gene being represented as a set of three coordinates in arbitrary space. Assuming the mean coordinates of all genes to correspond to the center of the genome in 3D space, we calculated its euclidean distance from each gene and then took quantiles of these distances to assign genes into three sections: **Central**, bottom quartile (lowest 25% of the distances), **Intermediate**, middle half (>25% and <75% of the distances) and **Peripheral**, top quartile (highest 25% of the distances): [sacCer2_3D_gene_coordinates.bed](files/sacCer2_3D_gene_coordinates.bed)  
   
3. Gene Duplication Events. Gene duplication events were obtained from [Guan et al, 2007](https://academic.oup.com/genetics/article/175/2/933/6061278)
   1. Small-scale duplicate (SSD) gene pairs: [SSD.gene.pairs.tsv](files/SSD.gene.pairs.tsv)
   2. Whole-genome duplicate (WGD) gene pairs: [WGD.gene.pairs.tsv](files/WGD.gene.pairs.tsv)

4. Gene Duplication clusters/territories were created by extending the region between consecutive duplicated genes of the same type by 10kb on either side until meeting another gene of the same type. The "merged" coordinate files were then used as chromsomal coordinates to delineate:
   1. [SSD clusters](files/sacCer2_SSD_clusters.bed) and 
   2. [WGD clusters](files/sacCer2_WGD_clusters.bed). 
   3. The rest of the genome was attributed to [Genome Complement](files/sacCer2_Complement_clusters.bed)
   
5. Gene Length, Gene Spacing and Coding Density. Files containing Gene Size and non-coding Gene Spacer length were created using the [coordinate file](files/sacCer2_gene_coordinates.bed). 
   1. [Gene Size and Gene Spacers](files/YeastGenes_GeneSizeSpacers.tsv). 
   2. Coding density was calculated as the percentage of coding sequences spanning a region of eleven genes, symmetrically flanking the gene in question: [Yeast Genes Coding Density per 10kb](files/YeastGenes_CodingDensity.tsv)
   
6. Gene Age. The phylogenetic age of _S. cerevisiae_ genes was determined by phylostratigraphy. We performined BLASTP (States and Gish 1994)⁠ searches on all available Fungi proteomes in GenBank (794 unique species excluding S. cerevisiae, 1,266 total proteomes, downloaded December 2019) with an E-value cutoff of 1E-3. Age was defined by as the most recent common ancestor of species that shared a homologue. The NCBI Taxonomy common tree was used, resulting in genes classified in the following phylogenetic ages: species-specific , genus (Saccharomyces), family (saccharomycetaceae), order (saccharomycetales), division (ascomycota) or kingdom (fungi). [Yeast Gene Phylostratigraphy](files/yeastgene_phylostratigraphy.tsv)

7. Distance from Centromeres/Telomers, mean Gene Conservation, Expression Variability and Nucleosome Positioning are all contained in one file. 
   1. Distances to the centromeres and the chromosomal edges were calculated as ratios over the entire chromosomal length as described in[Tsochatzidou et al. 2017](https://academic.oup.com/nar/article/45/10/5818/3079510)
   2. Aggregation of phastCons and structural constraint values was done through the calculation of a mean score over the segment under question, thus taking the average of all single-nucleotide-resolution values over the complete length of each gene.
   3. Transcriptional variability was assessed as z-score normalized variance of the expression values from a compendium of ~2400 experimental conditions from the SPELL database [(Hibbs et al., 2007)](https://academic.oup.com/bioinformatics/article/23/20/2692/229926)
   4. Nucleosome positioning data were obtained from a genome wide MNase profiling [Jiang and Pugh 2009](https://www.nature.com/articles/nrg2522). Average gene profiles were created as described above for the same regions and bin size.  Nucleosome positioning similarities for duplicate gene pairs were calculated as Pearson correlation coefficients of the nucleosome positioning 10nt-bin profiles.
   A file containing all of the above may be found [here](files/YeastGenes_Tel_Cent_ARS_Distance_phCons_TrPlasticity_NucleosomePositioning.bed)

    
8.  Gene Regulatory binding sites. Regulatory binding site information was obtained from [Mc Isaac et al., 2006](https://bmcbioinformatics.biomedcentral.com/articles/10.1186/1471-2105-7-113): [Regulatory Code](files/sacCer2_RegulatoryCode.tsv)

9.  Sequence and Structural Constraints along the TSS of genes. 
   1.  Sequence Conservation Patterns along the TSS of all yeast genes were created with aggregation of PhastCons Scores: [Sequence Conservation](files/sacCer2_PhastCons_TSS_profiles.tsv)
   2.  Structural Conservation Patterns were created in the same way using the model of [(Routhier et al., 2020)](https://genome.cshlp.org/content/early/2021/01/19/gr.264416.120): [Structural Conservation](files/sacCer2_strucCons_TSS_profiles.tsv)
    
10. PFAM domains and Protein-protein interactions.
    1.  PFAM domains were obtained for each yeast gene and then their number and length ratio in the gene was calculated: [Yeast Genes PFAM Domains](files/YeastGenes_PFAM_Domains.tsv)
    2.  Protein-protein interactions were obtained from [STRING-DB](https://string-db.org/) and the number of interaction for each gene was calculated on the basis of experimental evidence: [Yeast Genes PPI](files/YeastGenes_Number_STRING_PPI.tsv)

