# Description:
#   Hearsay posts a URL to an astrology website?
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay horoscope (list|<sign>) - (*BETA*) You are silly if you believe in this stuff.
#   
# Author:
#	Harlock

module.exports = (robot) ->
	robot.respond /(horoscope )(.*)/i, (msg) ->
	  
	  if msg.match[2] == 'libra'
	   msg.send "Daily Horoscope for #{escape(msg.match[2])} | http://www.astrology.com/horoscope/daily/#{escape(msg.match[2])}.html"
	  else
	   msg.send "Sorry, I didn't understand that command."
