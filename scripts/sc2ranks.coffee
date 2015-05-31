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
#	Hearsay sc2ranks <player> - Pulls up Player Data
#
# Author:
#   Table

module.exports = (robot) ->
	robot.respond /(sc2ranks )(.*)/i, (msg) ->
	msg.send "um ok"
