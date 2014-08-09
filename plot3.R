###############################################################################
#
#   plot3.R
#   Author: Eugene Jarder
#
#   Generates plot to fulfill the requirements for plot3.png.
#
#   Plot drawing function: plot.sub.metering.to.date.time() in
#                          plot.functions.R
#
#   dependencies:
#       plot.functions.R - must be in the same folder as plot3.R
#
#   usage:
#       setwd(<location of plot3.R>)
#       source('plot3.R')
#
###############################################################################

source('plot.functions.R')

plot.to.png('plot3.png', plot.sub.metering.to.date.time)
