###############################################################################
#
#   plot1.R
#   Author: Eugene Jarder
#
#   Generates plot to fulfill the requirements for plot1.png.
#
#   Plot drawing function: hist.global.active.power() in plot.functions.R
#
###############################################################################

source('plot.functions.R')

plot.to.png('plot1.png', hist.global.active.power)
