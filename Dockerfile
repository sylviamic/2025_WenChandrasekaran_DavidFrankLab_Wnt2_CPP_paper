FROM jupyter/minimal-notebook:python-3.10.11

USER ${NB_UID}

# copy environments over
COPY transcriptomics_env.yml /opt/conda/transcriptomics_env.yml

# create the environments and cleanup
RUN mamba env update --name base --file=/opt/conda/transcriptomics_env.yml && \
    mamba clean --all --yes

# clean up permissions
USER root
RUN fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER ${NB_UID}

# Set env variables
ENV XDG_CACHE_HOME="/home/${NB_USER}/.cache/" \
    JUPYTER_ENABLE_LAB="yes" \
    NUMBA_CACHE_DIR="/home/${NB_USER}/.cache/numba_cache"

# prepare for entrypoint
WORKDIR ${HOME}
CMD ["start-notebook.sh", "--NotebookApp.token=''"]