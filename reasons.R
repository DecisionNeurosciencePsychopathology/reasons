setwd('~/Box Sync/skinner/projects_analyses/Project Reasons/')

library(corrplot)
library(readr)

df <- read_csv('~/Box Sync/skinner/projects_analyses/Project Reasons/AllVarPOA_MostRecent_AboveAge40_1152017.csv')
View(df)

chars <- df[,c(12,42,45,52:56,63:75,131:133)]
#head(just_rois)
cormat <- cor(na.omit(chars))
pdf("trait correlations.pdf", width=14, height=14)
cors <- corr.test(chars, use = "pairwise",method="spearman", alpha=.05)

corrplot(cors$r, cl.lim=c(-1,1),
         method = "circle", tl.cex = 1.5, type = "upper", tl.col = 'black',
         order = "AOE", diag = FALSE,
         addCoef.col="black", addCoefasPercent = FALSE,
         p.mat = cors$p, sig.level=0.05, insig = "blank")
# p.mat = 1-abs(cormat), sig.level=0.75, insig = "blank")
dev.off()