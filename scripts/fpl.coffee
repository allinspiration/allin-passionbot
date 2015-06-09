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
  robot.respond /fpl$/i, (msg) ->
    msg.send "ALLIN Fantasy Proleague | Current Standings: "http://www.teamliquid.net/fantasy/proleague/Standings.php?r=24&g=4062"
		
		
