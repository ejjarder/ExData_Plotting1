###############################################################################
#
#   plot2.R
#   Author: Eugene Jarder
#
#   Generates plot to fulfill the requirements for plot2.png.
#
#   Plot drawing function: plot.active.power.to.date.time() in
#                          plot.functions.R
#
###############################################################################

source('plot.functions.R')

plot.to.png('plot2.png', plot.active.power.to.date.time)
