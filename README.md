# PMF_from_SMD_data
##
## Canan Atilgan - 9 September 2022
##

### Calculate PMF from SMD output - with sample data from https://www.biorxiv.org/content/10.1101/2022.04.24.489309v1

Jupyter Notebook PMF_fromSMD.ipynb reads in data for position vs. force, both projected on the SMD direction from files with .dat extension.
A tcl file to extract these data from NAMD output files is also included (Extract_position_force.tcl).

#### The sample data are from that published in https://www.biorxiv.org/content/10.1101/2022.04.24.489309v1
#### Two sets of data are provided; (all files with .dat extension are treated as input)
####  > *wLIG:* Ras with cerubidine bound to the allosteric switch (notebook renamed PMF_wLIG.ipynb)
####  > _woLIG:_ ligand free Ras (notebook renamed PMF_woLIG.ipynb)
#### along with the outputs -- energies in units of either *kT* or *kcal/mol*; png files for figures.


For comparison, PMFs are calculated from <W>, exponential averaging, and the second cumulant (see Park et al. J. Chem. Phys. 119, 3559 (2003); https://doi.org/10.1063/1.1590311 for details) 

It is well known that calculating PMFs from SMD may be problematic using the second cumulant, particularly 
due to the presence of different pathways in the steered MD data set.

One quick and dirty way to determine those problematic sets may be to examine the individual work curves for each pulling. 
Here, you need to uncomment the related lines in the second block to determine the labels of the sets having high energy values.
You may choose to remove those files from your directory and rerun the block to circumvent the abovementioned problem.

The block averaging function is from github: shane5ul/blockAverage.py



