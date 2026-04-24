# Increasing the accuracy of ST-segment elevation detection in an ECG through automated visual rules

Files, data and scripts to fully recreate our two-part study investigating the use of novel visualisation techniques for scaffolding interpretation of ECG data.

## Data

All experimental data for the three experiments described in part II of the paper are located in `.csv` format in the `exp_data` folder.

## Scripts

The `additional_scripts` folder contains scripts for processing responses from pavlovia.org; the `processing_for_payment` scripts write .csv with lists of passed and failed participants to the `data` folder when run. The `anonymisation` script removes identifiable information from raw data files.

NB: Aside from anonymisation, data are provided *as-is*. The **wrangle** function in the .qmd *must* be run to make the dataset usable.

### Analysis Within a Fully-Reproducible Computational Environment

Resources are provided for the full reproduction of the computational environment (R, Rstudio, and package versions) that was used for data wrangling, visualisation, statistical modelling, and reporting.

To begin, clone this repository to your local machine. With Docker running in the background, use a terminal (or cmd on Windows) to navigate to the cloned repository and type the following Docker command:

```docker build -t ecg_x_increasing .```

If you're using a machine with an ARM processor, such as Apple Silicon, use the following command to build an image:

```docker buildx build --platform linux/amd64 -t ecg_x_increasing .```

Then, type:

```docker run --rm -p 8787:8787 -e PASSWORD=password ecg_x_increasing```

Once the container is running, open a web browser and type `localhost:8787` in the address bar. Enter the username `rstudio` and the password `password`. This will generate a fully functioning Rstudio session running from the docker container.

### Re-creating the manuscript

Opening `increasing_the_accuracy_of_ST-segment_elevation.qmd` and using the 'Render' button will allow you to re-create a .pdf of the manuscript.

IMPORTANT: Models have been cached to increase performance. The cache will not be recognised automatically when using RStudio within the Docker container. eval_models must be set to FALSE in line 10 in order to use the cached models. This will prevent `knitr` from executing the code for each model, but will 'lazyload' all cached models so they can be used in manuscript generation. Setting eval_models to TRUE in line 79 will result in all models being re-generated.

Files and folders used in generating manuscript:

 - `increasing_the_accuracy_of_ST-segment_elevation.qmd`: Full quarto markdown script including text and all code
 - `increasing_the_accuracy_of_ST-segment_elevation_cache/pdf`: folder containing cached models
 - `exp_data`: folder containing collected, anonymised data
 - `bibliography.bib` for referencing
 - `_extensions`: templates etc required for quarto to correctly render manuscript

Knitting the manuscript may take some time depending on the performance of your computer, especially if models are being re-built.

### Other Files

 - `graphics`: folder containing prepared graphics in `.png` format
 - `additional_scripts`: folder containing other R scripts detailed above

## Experiment Code and Materials

 - JT Group: [https://gitlab.pavlovia.org/Strain/ecg_x_jt](https://gitlab.pavlovia.org/Strain/ecg_x_jt)
 - ST Group: [https://gitlab.pavlovia.org/Strain/ecg_x_st](https://gitlab.pavlovia.org/Strain/ecg_x_st)
 - STJ Group: [https://gitlab.pavlovia.org/Strain/ecg_x_stj](https://gitlab.pavlovia.org/Strain/ecg_x_stj)
 
## Pre-Registration

Pre-registrations for hypotheses with the OSF can be found here:
 - [Part II Experiment](https://osf.io/v6tjp)
