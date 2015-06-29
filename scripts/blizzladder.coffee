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
#   @Hearsay blizzladder - I'll post some information about the current Blizzard ladder season!
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /blizzladder$/i, (msg) ->
    msg.send "2015 Blizzard Ladder Season 3 starts on June 29th, 2015 on the North American server. Grandmaster start and ladder lock dates have yet to be announced."
	
