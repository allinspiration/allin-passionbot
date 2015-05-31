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

coinflip = ['Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.', 'The coin has landed on its side...']

module.exports = (robot) ->
	robot.respond /coinflip$/i, (msg) ->
    msg.send msg.random coinflip
		
		