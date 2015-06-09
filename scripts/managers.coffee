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
#   @Hearsay managers - I'll post the current Management Team roster, so you know who to contact if you have any issues.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /fpl$/i, (msg) ->
    msg.send "[ALLIN] Management Team | Tang, MyriadTruths, Stark, Name, gdoggcasey, PSosa, Aquila, Jester, Shalashaka"
	
