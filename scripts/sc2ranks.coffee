# Description:
#   Brings up SC2 Ranks Data
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay sc2ranks <name>, sc2ranksleague, sc2ranksrace
#   
# Author:
#	TechFour

module.exports = (robot) ->
	robot.respond /(.*) (.*)/i, (msg) ->
	  
		player = () -> msg.send "Player Found: http://www.sc2ranks.com/search/hots/global/1v1/all/all/exact/#{escape(msg.match[2])}"
		league = () -> msg.send "League Stats: http://www.sc2ranks.com/stats/league"
		race = () -> msg.send "Race Stats: http://www.sc2ranks.com/stats/race"
	
		if msg.match[1] == 'sc2ranks'
			player()
		else if msg.match[1] == 'sc2ranksleague'
			league()
		else if msg.match[1] == 'sc2ranksrace'
			race()
		
