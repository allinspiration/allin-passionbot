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
#   @Hearsay fpl - I'll post a link to the most recent Fantasy Proleague group standings.
#
# Author:
#   Table

module.exports = (robot) ->
  robot.respond /fpl$/i, (msg) ->
    msg.send "[ALLIN] Fantasy Proleague | Current Standings: http://www.teamliquid.net/fantasy/proleague/Standings.php?r=24&g=4062"
	
