# Description:
#   Pulls up SC2Ranks data
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Hearsay sc2ranks league - Pulls up League Data
#	Hearsay sc2ranks race - Pulls up Race Data
#	Hearsay sc2ranks <player> - Pulls up Player Data
#
# Author:
#   Table


module.exports = (robot) ->
	robot.hear /!sc2ranks (.*)/i, (res) ->
	
	if res.match[1] == 'league'
			res.send "http://www.sc2ranks.com/stats/league"
		else if res.match[1] == 'race'
			res.send "http://www.sc2ranks.com/stats/race"
		else 
			res.send "http://www.sc2ranks.com/search/hots/global/1v1/all/all/exact/%".replace "%", res.match[1]


