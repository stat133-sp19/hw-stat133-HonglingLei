README
================

## Project Description
This project is mainly about the data analysis cycle of nba GSW data. 
In the data preparation stage, I downloaded data, cleaned data by manipulating them, merged files for further analysis.

In the core analysis stage, I wrote codes to make statistical summaries of different players' performances, plotted graphs to display their shots and changed the formats of the graphs to enable them to be shown in the final report.

In the reporting stage, I wrote an .Rmd file to display the analyzing process and results to readers. My final report includes the following parts - introduction, motivation, background, data, analysis, discussion, conclusion and references.


## Folder Description

### /data

This is the folder where all the raw data are stored, including a data dictionary, each player's performance and a combined dataset "shots_data.csv" which contains all five players' data.

### /code

Folder "code" contains the R scripts of preparing data and making plots. 

The file "make-shot-data-script.R" is to prepare data for further analysis and graphing, by adding some columns, merging separate tables, export summaries, etc.

The file "make-shot-charts-script.R" is to plot shots and export those graphs to the /images folder.

### /images

This is the folder where all the plotted graphs, and other downloaded pictures are stored. "gsw-shot-charts.pdf" and "gsw-shot-charts.png" contain the plots of shots for all the players.

### /output

This is the folder where all the statistical summaries are stored, including player-specific ones and the combined one.

### /report

This file contains the final report, in both .Rmd and .md format.



