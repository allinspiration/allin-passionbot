# Description:
#   None
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay devinfo - Want to help contribute to building my capabilities? I'll post some info on my development.
#
# Author:
#   Myriad Truths

module.exports = (robot) ->
	robot.respond /devinfo$/i, (msg) ->
    msg.send "I'm powered by PassionBot technology developed by SinCo Labs. My code base is open-sourced and maintained by the community at https://github.com/allinspiration/allin-passionbot/. Please feel free to make changes to my scripts and submit a pull request to get them merged back into the master branch!"
		
		