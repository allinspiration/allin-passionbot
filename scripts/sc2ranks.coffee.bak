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
#   Hearsay League SC2Ranks - Pulls up League Data.
#	Hearsay Race SC2Ranks - Pulls up Race Data.
#	Hearsay <Player> SC2Ranks - Searches for Player Data.
#
# Author:
#   Table

league = ['http://www.sc2ranks.com/stats/league']

race = ['http://www.sc2ranks.com/stats/race']

player = ['http://www.sc2ranks.com/search/hots/global/1v1/all/all/exact/%']

module.exports = (robot) ->
	robot.respond /(sc2ranks) (.*)/i, (msg) ->
	
	if msg.match[2] == 'league'
			msg.send league
		else if msg.match[2] == 'race'
			msg.send race
		else 
			msg.send player.replace "%", msg.match[2]
