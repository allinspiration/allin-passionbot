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
	
		if msg.match[2] == 'aries'
		 msg.send "Daily Horoscope for Aries (3/21-4/19) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'taurus'
		 msg.send "Daily Horoscope for Taurus (4/20-5/20) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'gemini'
		 msg.send "Daily Horoscope for Gemini (5/21-6/20) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'cancer'
		 msg.send "Daily Horoscope for Cancer (6/21-7/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'leo'
		 msg.send "Daily Horoscope for Leo (7/23-8/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
    else if msg.match[2] == 'virgo'
		 msg.send "Daily Horoscope for Virgo (8/23-9/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'libra'
		 msg.send "Daily Horoscope for Libra (9/23-10/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'scorpio'
		 msg.send "Daily Horoscope for Scorpio (10/23-11/21) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'sagittarius'
		 msg.send "Daily Horoscope for Sagittarius (11/22-12/21) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'capricorn'
		 msg.send "Daily Horoscope for Capricorn (12/22-1/19) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'aquarius'
		 msg.send "Daily Horoscope for Aquarius (1/20-2/18) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'pisces'
		 msg.send "Daily Horoscope for Pisces (2/19-3/20) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		else if msg.match[2] == 'list'
		 msg.send "http://i.imgur.com/iYSbBnA.jpg"
		else
		 msg.send "Sorry, I didn't understand that command."
