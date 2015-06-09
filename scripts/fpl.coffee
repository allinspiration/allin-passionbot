# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   !fpl - Opens link to Allin FPL Group
#
# Author:
#   Table

module.exports = (robot) ->
	robot.hear /!fpl/i, (msg) ->
    msg.send "http://www.teamliquid.net/fantasy/proleague/Standings.php?r=24&g=4062"
		
		