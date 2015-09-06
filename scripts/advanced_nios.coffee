# Description:
#   Brings up nios.kr data for players and teams
#   Will only find highest ranked player on a search
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay niosplayer <player name>, niosteam <clan tag>
#   
# Author:
#	TechFour

module.exports = (robot) ->
	robot.respond /(.*) (.*)/i, (msg) ->
	  
		player = () -> msg.send "Player Found:http://nios.kr/sc2/us/1v1/hots/search/#{escape(msg.match[2])}"
		playereu = () -> msg.send "Player Found:http://nios.kr/sc2/eu/1v1/hots/search/#{escape(msg.match[2])}"
		playersea = () -> msg.send "Player Found:http://nios.kr/sc2/sea/1v1/hots/search/#{escape(msg.match[2])}"
		playerkr = () -> msg.send "Player Found:http://nios.kr/sc2/kr/1v1/hots/search/#{escape(msg.match[2])}"
		playercn = () -> msg.send "Player Found:http://nios.kr/sc2/cn/1v1/hots/search/#{escape(msg.match[2])}"
		team = () -> msg.send "Team Found: http://nios.kr/sc2/us/clan/detail/#{escape(msg.match[2])}"
		teameu = () -> msg.send "Team Found: http://nios.kr/sc2/eu/clan/detail/#{escape(msg.match[2])}"
		teamsea = () -> msg.send "Team Found: http://nios.kr/sc2/sea/clan/detail/#{escape(msg.match[2])}"
		teamkr = () -> msg.send "Team Found: http://nios.kr/sc2/kr/clan/detail/#{escape(msg.match[2])}"
		teamcn = () -> msg.send "Team Found: http://nios.kr/sc2/cn/clan/detail/#{escape(msg.match[2])}"
	
		if msg.match[1] == 'niosplayer'
			player()
		else if msg.match[1] == 'niosplayereu'
			playereu()
		else if msg.match[1] == 'niosplayersea'
			playersea()
		else if msg.match[1] == 'niosplayerkr'
			playerkr()
		else if msg.match[1] == 'niosplayercn'
			playercn()
		else if msg.match[1] == 'niosteam'
			team()
		else if msg.match[1] == 'niosteameu'
			teameu
		else if msg.match[1] == 'niosteamsea'
			teamsea()
		else if msg.match[1] == 'niosteamkr'
			teamkr()
		else if msg.match[1] == 'niosteamcn'
			teamcn()
			
