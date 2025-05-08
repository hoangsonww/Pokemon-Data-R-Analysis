# Use official R base image
FROM r-base:4.3.2

# Install system dependencies (if needed)
RUN apt-get update && apt-get install -y \
    texlive-latex-base texlive-fonts-recommended \
    texlive-latex-extra

# Install R packages
RUN R -e "install.packages(c('ggplot2','dplyr'), repos='https://cloud.r-project.org/')"

WORKDIR /app
COPY . .

# Default: run analysis and build report
CMD ["bash", "-lc", "bash scripts/run_pokemon.sh && make report"]
