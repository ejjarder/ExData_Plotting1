###############################################################################
#
#   plot.utils.R
#   Author: Eugene Jarder
#
#   Contains the various utility functions and constants used to generate the
#   plots.
#
###############################################################################

# The URL of the zip file containing the data. Taken from the course project
# page.
#
zip.file <- file.path('https://d396qusza40orc.cloudfront.net',
                      'exdata%2Fdata%2Fhousehold_power_consumption.zip')

# The sub metering labels. Used in subsetting and displaying the data.
#
sub.metering.labels <- paste0('Sub_metering_', 1:3)

# download.zip()
# Download the zip file to a temporary directory and extract the contents to
# the specified working directory. Delete the temporary file afterwards.
#
# params:
#   working.directory - the directory to extract the data to
#
download.zip <- function(working.directory)
{
    random.filename <- paste(sample(c(0:9, letters, LETTERS),
                                    8, replace=TRUE), collapse='')

    temp.zip <- file.path(tempdir(), paste(random.filename, '.zip', sep = ''))
    download.file(zip.file, temp.zip, quiet = TRUE)

    unzip(temp.zip, exdir = working.directory)

    unlink(temp.zip)
}

# read.power.data()
# Read the contents of the specified data file and return the formatted data
# frame containing the data.
#
# params:
#   data.file - the file to read
#
read.power.data <- function(data.file)
{
    # First two columns are characters, the rest are numeric
    data.column.classes <- c(rep('character', 2), rep('numeric', 7))

    # get only data from 01/02/2007 to 02/02/2007, which start from row
    # 66638 and has 2880 entries
    power.data <- read.table(data.file, header = FALSE, sep = ';',
                             colClasses = data.column.classes,
                             na.strings = '?', skip = 66637, nrows = 2880)

    format.power.data(power.data)
}

# format.power.data()
# Takes the unformatted power data frame, merges the date and time columns into
# one column, and adds labels to it.
#
# params:
#   power.data - the unformatted data frame
#
format.power.data <- function(power.data)
{
    power.date.time <- paste(power.data$V1, power.data$V2)
    power.date.time <- strptime(power.date.time, format = '%d/%m/%Y %H:%M:%S')

    power.data <- cbind(power.date.time, power.data[3:9])

    colnames(power.data) <- c('Date.Time', 'Active.Power', 'Reactive.Power',
                              'Voltage', 'Intensity', sub.metering.labels)

    power.data
}

# draw.to.png()
# Open a PNG file, call the draw function on the data, and close the PNG file,
# whether the file write succeeds or not.
#
# params:
#   out.png - the output png file
#   draw.function - the function that will draw the plot
#   power.data - the data frame containing the power data
#
draw.to.png <- function(out.png, draw.function, power.data)
{
    png(filename = out.png, bg = 'transparent')
    tryCatch(
        {
            draw.function(power.data)
        },
        finally =
        {
            dev.off()
        }
    )
}

# plot.to.png()
# Draw the plot output by the given draw.function to out.png. First check if
# the data file exists in the given working directory. If not, download it.
#
# params:
#   out.png - the output png file
#   draw.function - the function that will draw the plot
#   working.directory - the directory that contains the
#                       household_power.consumption.txt data file.
#                     - defaults to the current working directory.
#
plot.to.png <- function(out.png, draw.function, working.directory = getwd())
{
    power.data.filepath <- file.path(working.directory,
                                     'household_power_consumption.txt')

    if (!file.exists(power.data.filepath))
    {
        download.zip(working.directory)
    }

    power.data <- read.power.data(power.data.filepath)
    draw.to.png(out.png, draw.function, power.data)
}
