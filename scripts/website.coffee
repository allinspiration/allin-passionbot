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
#   @Hearsay website - I'll post the URL of the team website.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /website$/i, (msg) ->
    msg.send "[ALLIN] Official Website | http://all-inspiration | Mirror: http://teamall.in"
