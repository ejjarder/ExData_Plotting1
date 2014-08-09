## Introduction

This repository contains scripts that generate the plots required for the Exploratory Data Analysis course of the Data Scientist Track on coursera.

## Assumptions

The script assumes that the data will always be available the given <a href="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip">url</a>. If the data is not available at the working directory, it will try to download it from that URL.

It also assumes that the data will not change. The requirement for the script was to plot data between 2007-02-01 and 2007-02-02. These data are found from line 66638 and has 2880 entries. The script will only read that data.

## Implementation

The repository contains the following scripts:

### [plot.utils.R](plot.utils.R)

Contains utility functions and constants used for generating the plots. It contains the function used to download the zip file, and the function to write the plot to a *.png file.

### [plot.functions.R](plot.functions.R)

Contains functions that actually generate the plots. The developer decided to put all of the functions in one file as there are plots that are common to multiple required plots. The functions used by the plots are described below.

### [plot1.R](plot1.R)

Output: [plot1.png](plot1.png)
Plot Function: `hist.global.active.power()` in [plot.functions.R](plot.functions.R)

### [plot2.R](plot2.R)

Output: [plot2.png](plot2.png)
Plot Function: `plot.active.power.to.date.time()` in [plot.functions.R](plot.functions.R)

### [plot3.R](plot3.R)

Output: [plot3.png](plot3.png)
Plot Function: `plot.sub.metering.to.date.time()` in [plot.functions.R](plot.functions.R)

### [plot4.R](plot4.R)
 
Output: [plot4.png](plot4.png)
Plot Function: `multi.plot()` in [plot.functions.R](plot.functions.R)

The function `multi.plot()` in turn calls the following functions also found in [plot.functions.R](plot.functions.R) to generate the plots:

* `plot.active.power.to.date.time()` - pass FALSE to second argument to display the correct y-axis label
* `plot.voltage.to.date.time()`
* `plot.sub.metering.to.date.time()` - pass FALSE to the second argument to not display the box around the legend
* `plot.reactive.power.to.date.time()`

## Usage

All the plot*.R files must be in the same directory. In R, the user can then set the working directory to that directory, and call `source('plot<x>.R')`, where `<x>` is the number of the plot the user wants to generate. Sourcing the script will automatically generate the corresponding plot.

## Results

### Plot 1

#### Reference

![plot of chunk unnamed-chunk-2](figure/unnamed-chunk-2.png)

#### Submitted

![plot1](plot1.png)


### Plot 2

#### Reference

![plot of chunk unnamed-chunk-3](figure/unnamed-chunk-3.png)

#### Submitted

![plot2](plot2.png)


### Plot 3

#### Reference

![plot of chunk unnamed-chunk-4](figure/unnamed-chunk-4.png)

#### Submitted

![plot3](plot3.png)


### Plot 4

#### Reference

![plot of chunk unnamed-chunk-5](figure/unnamed-chunk-5.png)

#### Submitted

![plot4](plot4.png)
