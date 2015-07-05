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
    msg.send "2015 Blizzard Ladder Season 3 starts on June 29th, 2015 on the North American server. The Ladder locks on November 3rd, which is when activity penalties and ladder awards will be assessed."
	
