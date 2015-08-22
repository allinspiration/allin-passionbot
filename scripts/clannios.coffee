# Description:
#   Brings up another team's nios.
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay nios <clan tag>
#   
# Author:
#	TechFour

module.exports = (robot) ->
	robot.respond /(.*) (.*)/i, (msg) ->
	  
		clannios = () -> msg.send "#{escape(msg.match[2]) Nios.kr Rankings | NA: http://nios.kr/sc2/us/clan/detail/#{escape(msg.match[2]) | EU: http://nios.kr/sc2/eu/clan/detail/#{escape(msg.match[2]) | SEA: http://nios.kr/sc2/sea/clan/detail/#{escape(msg.match[2]) | KR: http://nios.kr/sc2/kr/clan/detail/#{escape(msg.match[2])"
		DNE = () -> msg.send "Sorry, something went wrong."
		
		if msg.match[1] == 'nios'
			clannios()
		else
			DNE()
			
