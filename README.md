# Treemmer
Python tool to reduce size and redundancy of phylogenetic datasets

Here you find the software, the data and scripts used in the manuscript (Influenza_data, MTB_data and stochastic_component), and a short tutorial on fine tuning the behaviour of Treemmer with the pruning options.


## Basic usage
Plot relative tree length decay.

```
python3 Treemmer_v0.3.py tree_file
```

Prune tree until the realitve tree length is 90% of starting tree.

```
python3 Treemmer_v0.3.py tree_file -RTL 0.9
```

Prune tree to 100 tips.

```
python3 Treemmer_v0.3.py tree_file -X 100
```


## Installation

From version 0.3 Treemmer is compatible with both python 2 and python 3 

Dependencies:

ETE3

Joblib

Numpy

Matplotlib

## Use with singularity

Treemmer can be used with singularity (instructions for installation [here](https://docs.sylabs.io/guides/3.0/user-guide/installation.html)).

For example:

- download the image of the container:
```
singularity pull --arch amd64 library://fmenardo/treemmer/treemmer:0.3
```
- build the container
```
singularity build --sandbox treemmer_sb/ treemmer_0.3.sif
```
- run Treemmer
```
singularity exec treemmer_sb/ python3 /Treemmer_v0.3.py -h
```



## Citation

If you use Treemmer please cite:

Menardo et al. (2018). Treemmer: a tool to reduce large phylogenetic datasets with minimal loss of diversity. BMC Bioinformatics 19:164.

https://doi.org/10.1186/s12859-018-2164-8.

From version 0.3 Treemmer is compatible with both python 2 and python 3 

Dependencies:

ETE3

Joblib

Numpy

Matplotlib

Check also treemmer-animate, a script by Thomas Hackl to visualize the "treemming" process: https://github.com/thackl/treemmer-animate
