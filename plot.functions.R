###############################################################################
#
#   plot.functions.R
#   Author: Eugene Jarder
#
#   Contains the functions that actually generate the plots.
#
###############################################################################

source('plot.utils.R')

# global.active.power.label()
# Get the correct global active power label, whether it is the full name or
# just the basic label
#
# params:
#   full.label - whether to get the full label or not
#
global.active.power.label <- function(full.label)
{
    if (full.label)
    {
        'Global Active Power (kilowatts)'
    }
    else
    {
        'Global Active Power'
    }
}

# line.plot.to.date.time()
# Create a line plot of the specified data to plot over the data's date-time.
#
# params:
#   power.data - the data frame containing the power data
#   data.to.plot - the column name of the data to plot over date-time
#   xlab - the label of the date-time axis
#   ylab - the label of the plotted data axis
#
line.plot.to.date.time <- function(power.data, data.to.plot, xlab, ylab)
{
    plot(power.data[[data.to.plot]] ~ power.data$Date.Time, type = 'l',
         xlab = xlab, ylab = ylab, main = '')
}

# hist.global.active.power()
# Plot the histogram of the global active power.
# Fulfills the requirements to generate plot1.png
#
# params:
#   power.data - the data frame containing the power data
#
hist.global.active.power <- function(power.data)
{
    hist(power.data$Active.Power, xlab = global.active.power.label(TRUE),
         col = 'red', main = global.active.power.label(FALSE))
}

# plot.active.power.to.date.time()
# Plot the global active power against date-time.
# Fulfills the requirements to generate plot2.png.
# Used to generate a plot for plot4.png.
#
# params:
#   power.data - the data frame containing the power data
#   full.label - whether to display the full label of the global active power
#
plot.active.power.to.date.time <- function(power.data, full.label = TRUE)
{
    line.plot.to.date.time(power.data, 'Active.Power', '',
                           global.active.power.label(full.label))
}

# plot.sub.metering.to.date.time()
# Plot the three sub metering data against date-time
# Fulfills the requirements to generate plot3.png.
# Used to generate a plot for plot4.png.
#
# params:
#   power.data - the data frame containing the power data
#   show.legend.box - whether to show the box bordering the plot's legend.
#
plot.sub.metering.to.date.time <- function(power.data, show.legend.box = TRUE)
{
    meta.data <- data.frame(label = sub.metering.labels,
                            color = c('black', 'red', 'blue'),
                            stringsAsFactors = FALSE)
    plot(power.data[[meta.data$label[1]]] ~ power.data$Date.Time,
         type = 'n', xlab = '', ylab = 'Energy sub metering', main = '')
    apply(meta.data, 1, add.line.to.plot.sub.meter.plot, power.data)
    legend('topright', col = meta.data$color, legend = meta.data$label,
           lty = 1, bty = if (show.legend.box) 'o' else 'n')
}

# add.line.to.plot.sub.meter.plot()
# Add a line plot to the plot being processed.
# Used by plot.sub.metering.to.date.time to draw each sub metering data.
#
# params:
#   meta.data.row - one row of data in the data frame
#   power.data - the data frame containing the power data
#
add.line.to.plot.sub.meter.plot <- function(meta.data.row, power.data)
{
    lines(power.data[[meta.data.row['label']]] ~ power.data$Date.Time,
          col = meta.data.row['color'])
}

# plot.voltage.to.date.time()
# Plot the voltage to the date time.
# Used to generate a plot for plot4.png.
#
# params:
#   power.data - the data frame containing the power data
#
plot.voltage.to.date.time <- function(power.data)
{
    line.plot.to.date.time(power.data, 'Voltage', 'datetime',
                           'Voltage')
}

# plot.reactive.power.to.date.time()
# Plot the global reactive power to the date time.
# Used to generate a plot for plot4.png.
#
# params:
#   power.data - the data frame containing the power data
#
plot.reactive.power.to.date.time <- function(power.data)
{
    line.plot.to.date.time(power.data, 'Reactive.Power', 'datetime',
                           'Global_reactive_power')
}

# multi.plot()
# Generate the four plots needed to fulfill requirements for plot4.png.
#
# params:
#   power.data - the data frame containing the power data
#
multi.plot <- function(power.data)
{
    par(mfrow = c(2, 2))
    plot.active.power.to.date.time(power.data, FALSE)
    plot.voltage.to.date.time(power.data)
    plot.sub.metering.to.date.time(power.data, FALSE)
    plot.reactive.power.to.date.time(power.data)
}
