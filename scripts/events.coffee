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
#   @Hearsay programs - I'll post some info about currently ongoing team programs and intiatives!
#
# Author:
#   Harlock

module.exports = (robot) ->
  robot.respond /programs$/i, (msg) ->
    msg.send "[ALLIN] Programs
              [ONGOING] 2015 Season 3 Ladder Awards | Info:
              [COMING SOON] ALLIN 2015-2016 Fantasy Proleague | TBD"
	
