# Description:
#   Magic Eight Ball
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay what is the saddest thing? - I'll post a link to the saddest thing on the internet.
#
# Author:
#   Myriad Truths

module.exports = (robot) ->
  robot.respond /what is the saddest thing (.*)/i, (msg) ->
    msg.send "The Tale Of Smith by Xy Hapu | http://www.insanefruits.net/v_002/histories/smith/"
	
