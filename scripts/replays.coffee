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
#   @Hearsay replays - I'll post some information on how to send cool replays to the ALLIN replay vault for later casting.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /replays$/i, (msg) ->
    msg.send "Have a cool replay you want to show off? Email it to the ALLIN Replay Vault (allin.replays@gmail.com) and it just might get featured on stream!"
	
