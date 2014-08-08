###############################################################################
#
#   plot4.R
#   Author: Eugene Jarder
#
#   Generates plot to fulfill the requirements for plot4.png.
#
#   Plot drawing function: multi.plot() in plot.functions.R
#                          multi.plot() in turn calls the following functions:
#                           - plot.active.power.to.date.time()
#                           - plot.voltage.to.date.time()
#                           - plot.sub.metering.to.date.time()
#                           - plot.reactive.power.to.date.time()
#
#                          All functions are defined in plot.functions.R
#
###############################################################################

source('plot.functions.R')

plot.to.png('plot4.png', multi.plot, getwd())
