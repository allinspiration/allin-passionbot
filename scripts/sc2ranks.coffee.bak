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
#   !sc2ranks league - Pulls up League Data
#	!sc2ranks race - Pulls up Race Data
#	!sc2ranks <player> - Pulls up Player Data
#
# Author:
#   Table


module.exports = (robot) ->
	robot.hear /!sc2ranks (.*)/i, (res) ->
	data = res.match[1]
	
	if data is "league"
		res.send "http://www.sc2ranks.com/stats/league"
	else if data is "race"
		res.send "http://www.sc2ranks.com/stats/race"
	else 
		res.send "http://www.sc2ranks.com/search/hots/global/1v1/all/all/exact/#{data}"


