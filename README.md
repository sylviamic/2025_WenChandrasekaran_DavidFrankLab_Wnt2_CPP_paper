# scRNA-seq analysis notes for Wen, Chandrasekaran et al. 2025

This repository contains jupyter notebooks outlining the analyses
performed in the Wen, Chandrasekaran et al. 2025 paper on cardiopulomonary
projenitor cell fates. It also includes conda environment specifications 
for library dependencies, and a Dockerfile for performing re-analysis in a 
container.

This work was performed in the David Frank lab at the 
Children's Hospital of Philadelpia (CHOP).

## Instructions

Clone the repository:

```
git clone https://github.com/sylviamic/2025_WenChandrasekaran_DavidFrankLab_Wnt2_CPP_paper
```

Build the container:

```
cd 2025_WenChandrasekaran_DavidFrankLab_Wnt2_CPP_paper
docker image build --tag 2025_wen_chandrasekaran_jupyter_nbimage .
```

Download the data:

```
cd 2025_WenChandrasekaran_DavidFrankLab_Wnt2_CPP_paper/data
wget -i raw_data_download_urls.txt
```

Launch the container:
```
cd 2025_WenChandrasekaran_DavidFrankLab_Wnt2_CPP_paper
docker run \
	-v ./data:/home/jovyan/data \
	-v ./notebooks:/home/jovyan/notebooks \
	-it \
	-p 8989:8888 \
	2025_wen_chandrasekaran_jupyter_nbimage
```

Open `http://127.0.0.1:8989` in your favorite web browser and
start performing your re-analysis!

## Citation
[forthcoming]

## Contact
Sylvia N. Michki (`michkin [at] chop [dot] edu`)
David B. Frank (`frankd [at] chop [dot] edu`)