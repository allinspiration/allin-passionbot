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
#   @Hearsay ladder - I'll post a link to the [ALLIN] Internal Ladder system.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /ladder$/i, (msg) ->
    msg.send "[ALLIN] Internal StarCraft 2 Ladder | http://ladder.all-inspiration.com | Send a pm to Stark or MyriadTruths to get a login!"
