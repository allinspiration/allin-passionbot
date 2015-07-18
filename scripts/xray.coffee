# Description:
#   Hearsay uses xray glasses
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay (penalyze|vagalize|analyze|titalyze) <name> - (*BETA*) This is probably an HR violation.
#   
# Author:
#	Harlock

module.exports = (robot) ->
	robot.respond /(.*) (.*)/i, (msg) ->
	  
		analyze = () -> msg.send "Scan complete. HR violation recorded. | http://en.inkei.net/anus/#{escape(msg.match[2])}"
		vagalyze = () -> msg.send "Scan complete. HR violation recorded. | http://en.inkei.net/vagina/#{escape(msg.match[2])}"
		titalyze = () -> msg.send "Scan complete. HR violation recorded. | http://en.inkei.net/tits/#{escape(msg.match[2])}"
		penalyze = () -> msg.send "Scan complete. HR violation recorded. | http://en.inkei.net/#{escape(msg.match[2])}"
		
	
		if msg.match[1] == 'analyze'
		  analyze()
		else if msg.match[1] == 'penalyze'
			penalyze()
		else if msg.match[1] == 'vagalyze'
		  vagalyze()
		else if msg.match[1] == 'titalyze'
		  titalyze()
		end if
