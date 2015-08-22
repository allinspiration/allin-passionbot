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
#   @Hearsay bring out the dancing lobsters - I'll attempt to bring out the dancing lobsters. No promises.
#
# Author:
#   Table

lobsters = ['Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','Sorry, the lobsters are currently sleeping.','https://i.imgur.com/6ooBUh.jpg']
module.exports = (robot) ->
	robot.respond /(bring out the dancing lobsters)/i, (msg) ->
    msg.send msg.random lobsters
		
