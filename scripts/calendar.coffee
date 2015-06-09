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
#   @Hearsay calendar - I'll post a link to the team's public calendar, so you can stay informed about upcoming events!
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /calendar$/i, (msg) ->
    msg.send "[ALLIN] Calendar of Events | http://all-inspiration.com/calendar | Want to host your own event? Read this: http://all-inspiration.com/eventhosting"
	
