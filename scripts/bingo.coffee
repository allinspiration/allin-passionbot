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
#   @Hearsay bingo - Displays current [ALLIN] Bingo cards!
#
# Author:
#   Myriad Truths

module.exports = (robot) ->
	robot.respond /bingo$/i, (msg) ->
    msg.send "[ALLIN] Bingo Cards | https://goo.gl/wJ9Av1"
		
		