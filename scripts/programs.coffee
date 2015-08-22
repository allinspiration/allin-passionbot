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
    msg.send "[ONGOING] 2015 Season 3 Ladder Awards | Info: http://goo.gl/RVYXc2"
    msg.send "[ONGOING] The All-Invitational VII    | Trailer + Signup: http://all-inspiration.com/tai7"
    msg.send "[ONGOING] Chobo Team League Season 10 | Info: http://choboteamleague.com. PM Lumiya for more info!"
    msg.send "[ONGOING] ALLIN Fantasy Proleague 2015-2016 Round 4 | Use Hearsay 'fpl' command for more info!"
	
