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
#   @Hearsay donate - I'll post some information on how to financially contribute to the team!
# Author:
#   Table

module.exports = (robot) ->
  robot.respond /donate$/i, (msg) ->
    msg.send "[ALLIN] Patreon Fundraiser Page | https://www.patreon.com/allinspiration | Help us keep the lights on; even small contributions are greatly appreciated!"
	
