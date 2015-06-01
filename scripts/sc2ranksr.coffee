# Description:
#   Pulls up SC2Ranks data
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#	!sc2ranks race - Pulls up Race Data
#
# Author:
#   Table


module.exports = (robot) ->
	robot.hear /!sc2ranks race/i, (msg) ->
	msg.send "http://www.sc2ranks.com/stats/race"
