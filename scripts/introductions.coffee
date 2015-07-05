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
		introducehearsay = () -> msg.send "(hearsay) Greetings! I am Hearsay, ALLIN-Cyborg relations. I am an artificial intelligence powered by SinCo's patented PassionBot technology designed to assist All-Inspiration members to the best of my abilities. If you are looking for assistance on how to use HipChat, please type @HipChat for more information. To access my complete library of commands, open a private message with me and type help. My codebase is open-sourced on GitHub at http://github.com/allinspiration/allin-passionbot -- please contribute if you can and help make me even smarter!"
		
		if msg.match[2] == 'me'
			introducingme()
		else if msg.match[2] == 'yourself'
		  introducehearsay()
		else if msg.match[2] == 'Hearsay'
		  introducehearsay()
		else if msg.match[2] == 'managers'
		  msg.send "Here's a quick cheatsheet. Ask me about someone specific if you want to know more. http://i.imgur.com/znouHpl.jpg"
		else if msg.match[2] == 'Tang'
			msg.send "@Tang is the founder and owner of Team All-Inspiration. He is our lord and savior. Hail Tang! (salute)"
		else if msg.match[2] == 'Harlock'
			msg.send "@Harlock is the CEO of (sinistar) SinCo Industries, the longest serving member of the (allin) Management Team, and most importantly, my creator. (content)"
		else if msg.match[2] == 'Aquila'
			msg.send "@Aquila is the worst at video games. (duckhunt)"
		else if msg.match[2] == 'Stark'
			msg.send "@Stark has a very sexy accent...or so, I'm told. (swoon)"
		else if msg.match[2] == 'PSosa'
			msg.send "I don't understand much that @PSosa says, to be honest. (shrug)"
		else if msg.match[2] == 'Jester'
			msg.send "I'm pretty sure she's one of those fake gamer girls... (gamergate)"
		else if msg.match[2] == 'Shalashaka'
			msg.send "@Shalashaka is the team Recruitment Manager, so he's basically responsible for all of you being here. As you can see, he's not very good at his job."
		else
			introducingunknown()
