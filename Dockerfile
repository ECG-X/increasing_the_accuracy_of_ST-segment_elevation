FROM rocker/verse:4.5.1

WORKDIR /home/rstudio

# Copy renv.lock
COPY --chown=rstudio:rstudio renv.lock ./renv.lock

# Install renv and restore packages
RUN R -e "install.packages('renv')"
RUN R -e "renv::restore(prompt = FALSE)"

# Copy project files.

COPY _extensions/ ./_extensions/
COPY additional_scripts/ ./additional_scripts/
COPY graphics/ ./graphics/
COPY increasing_the_accuracy_of_ST-segment_elevation_cache/ ./increasing_the_accuracy_of_ST-segment_elevation_cache/
COPY exp_data/ ./exp_data/
COPY bibliography.bib ./
COPY increasing_the_accuracy_of_ST-segment_elevation.qmd ./
COPY plos2025.bst ./
