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
    msg.send "[ONGOING] 2015 Season 3 Ladder Awards | Info: TBD"
    msg.send "[ONGOING] Chobo Team League Season 10 | Info: http://choboteamleague.com. PM gdoggcasey for more info!"
    msg.send "[COMING SOON] ALLIN 2015-2016 Fantasy Proleague Round 4 | TBD"
	
