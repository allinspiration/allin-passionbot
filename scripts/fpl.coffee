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
    msg.send "[ALLIN] Fantasy Proleague | Currently in the off-season. Check back soon!"
	
