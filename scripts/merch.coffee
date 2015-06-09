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
#   @Hearsay merch - I'll post a link to the [ALLIN] Merch shop!
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /merch$/i, (msg) ->
    msg.send "[ALLIN] Merch Store | http://goo.gl/kLKb7P"
	
