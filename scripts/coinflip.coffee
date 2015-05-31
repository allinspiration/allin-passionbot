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
#   @Hearsay coinflip - I'll simulate the necessary RNG for a coinflip and report the results.
#
# Author:
#   Myriad Truths

coinflip = ['Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.','Heads.', 'Tails.', 'The coin has landed on its side...']

module.exports = (robot) ->
	robot.respond /coinflip$/i, (msg) ->
    msg.send msg.random coinflip
		
		