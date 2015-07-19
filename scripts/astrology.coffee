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
	robot.respond /(horoscope ) (.*)/i, (msg) ->
	  
		aries = () -> msg.send "Daily Horoscope for Aries (3/21-4/19) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		taurus = () -> msg.send "Daily Horoscope for Taurus (4/20-5/20) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		gemini = () -> msg.send "Daily Horoscope for Gemini (5/21-6/20) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		cancer = () -> msg.send "Daily Horoscope for Cancer (6/21-7/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		leo = () -> msg.send "Daily Horoscope for Leo (7/23-8/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		virgo = () -> msg.send "Daily Horoscope for Virgo (8/23-9/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		libra = () -> msg.send "Daily Horoscope for Libra (9/23-10/22) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		scorpio = () -> msg.send "Daily Horoscope for Scorpio (10/23-11/21) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"	
		sagittarius = () -> msg.send "Daily Horoscope for Sagittarius (11/22-12/21) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		capricorn = () -> msg.send "Daily Horoscope for Capricorn (12/22-1/19) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		aquarius = () -> msg.send "Daily Horoscope for Aquarius (1/20-2/18) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		pisces = () -> msg.send "Daily Horoscope for Pisces (2/19-3/20) | http://www.astrology.com/horoscope/daily/(msg.match[2])}.html"
		zodiaclist = () -> msg.send "http://i.imgur.com/iYSbBnA.jpg"
	
	
		if msg.match[2] == 'aries'
		 aries()
		else if msg.match[2] == 'taurus'
		 taurus()
		else if msg.match[2] == 'gemini'
		 gemini()
		else if msg.match[2] == 'cancer'
		 cancer()
		else if msg.match[2] == 'leo'
		 leo()
    else if msg.match[2] == 'virgo'
		 virgo()
		else if msg.match[2] == 'libra'
		 libra()
		else if msg.match[2] == 'scorpio'
		 scorpio()
		else if msg.match[2] == 'sagittarius'
		 sagittarius()
		else if msg.match[2] == 'capricorn'
		 capricorn()
		else if msg.match[2] == 'aquarius'
		 aquarius()
		else if msg.match[2] == 'pisces'
		 pisces()
		else if msg.match[2] == 'list'
		 zodiaclist()
		else
		  msg.send "Sorry, I didn't understand that command."
		end if
		
		 
