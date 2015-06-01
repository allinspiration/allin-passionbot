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
#   !sc2ranks league - Pulls up League Data
#
# Author:
#   Table


module.exports = (robot) ->
	robot.hear /!sc2ranks league/i, (msg) ->
	msg.send "http://www.sc2ranks.com/stats/league"
	