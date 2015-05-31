# Description:
#   Nios script mark 2
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay niosredux <region> (race|tag|league)
#   
# Author:
#	Myriad Truths


module.exports = (robot) ->
	robot.respond /(niosredux )(.*)(.*)/i, (msg) ->

  nioslink = "http://nios.kr/sc2/us/1v1/hots/%/"
  allinnioslink = "http://nios.kr/sc2/us/clan/detail/AIlin"
	postnios = msg.send nioslink
	

#		encouragingme = () -> msg.send encourage.replace "%", msg.message.user.name
#		encouragingyou = () -> msg.send encourage.replace "%", msg.match[2]
		
		postingrace = () -> msg.send nioslink.replace "%", msg.match[3]
		postingallinnios = () > msg.send allinnioslink
		
		if msg.match[3] == 'zerg'
			postingrace()
		else if msg.match[3] == 'protoss'
			postingrace()
		else if msg.match[3] == 'terran'
			postingrace()
		else
			postingallinnios()
