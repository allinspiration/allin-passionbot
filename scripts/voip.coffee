# Description:
#   Voip (Placeholder)
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay voip - I'll post instructions on how to get the info for our teamspeak server.
#
# Author:
#   Myriad Truths

module.exports = (robot) ->
  robot.respond /voip(.*)/i, (msg) ->
    msg.send "To see the current Teamspeak server IP address and password, type !voip in General Chat."
	
