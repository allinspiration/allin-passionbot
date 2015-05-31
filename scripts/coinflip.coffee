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
#   Hearsay coinflip - RNGs a coinflip.
#
# Author:
#   Myriad Truths

module.exports = (robot) ->
	robot.respond /coinflip$/i, (msg) ->
    res.send res.random coinflip
		
		coinflip = ['Heads.', 'Tails.', 'The coin has landed on its side...']