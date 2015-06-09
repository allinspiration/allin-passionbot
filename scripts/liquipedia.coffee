# Description:
#   Liquipedia-ize it!
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay liquipedia - I'll post a link to the team's Liquipedia page.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
	robot.respond /liquipedia$/i, (msg) ->
    msg.send "[ALLIN] Liquipedia Page | http://wiki.teamliquid.net/starcraft2/User:SinistarLives/All-Inspiration"
