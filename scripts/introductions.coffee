# Description:
#   Hearsay makes introductions
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay introduce (me|yourself|<name>) - (*BETA*) I'll introduce myself and other users to new recruits!
#   
# Author:
#	WoogieNoogie

module.exports = (robot) ->
	robot.respond /(introduce )(.*)/i, (msg) ->
	  
		introducingme = () -> msg.send "Do it yourself, you lazy jerk."
		introducingunknown = () -> msg.send "I'm afraid I don't know that person well enough yet."
		introducehearsay = () -> msg.send "Greetings! I am Hearsay, ALLIN-Cyborg relations."
		
		if msg.match[2] == 'me'
			introducingme()
		else if msg.match[2] == 'yourself'
		  introducehearsay()
		else if msg.match[2] == '@MyriadTruths'
			msg.send "@MyriadTruths is the CEO of SinCo Industries, the longest serving member of the [ALLIN] Team Management Group, and most importantly, my creator."
		else if msg.match[2] == '@Aquila'
			msg.send "@Aquila is the worst at video games."
		else if msg.match[2] == '@Stark'
			msg.send "@Stark has a very sexy accent...or so, I'm told."
		else
			introducingunknown()
