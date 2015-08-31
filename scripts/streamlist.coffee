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
#   @Hearsay streamlist - I'll post a link to a list of all of the [ALLIN] Featured Streams which are currently live.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /streamlist$/i, (msg) ->
    msg.send "[ALLIN] Featured Streams | http://all-inspiration.com/streams | Interested in becoming an ALLIN Featured Streamer? Go here: https://goo.gl/J8Y6GA"
	
