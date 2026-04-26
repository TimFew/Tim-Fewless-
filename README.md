# Tim-Fewless-
# Replication Project
This project reproduces Table 1 from the paper *A Natural Experiment in Proposal Power and Electoral Success* using the authors’ replication data from Harvard Dataverse.

## What I did
I translated the original Stata regression into R and ran the same model to reproduce the main result.

## Files
- replication.R → R code used to run the model  
- Main Data.RData → dataset provided by the authors  

## Notes
One of the first issues I ran into was realizing the data was in an .RData file rather than a .dta file, so I initially tried to load it the wrong way. After figuring that out, I was able to load it correctly in R. I also found the dataset through Harvard Dataverse, which included the replication files and the original Stata code. I noticed that some variable names were slightly different from the Stata code (for example, "current" vs "current_vote"), so I had to match those carefully. In addition, I recreated the treatment variable (P2P) and the interaction term (govP2P) based on the logic in the do-file. Once those adjustments were made, I was able to successfully reproduce the main regression result.
