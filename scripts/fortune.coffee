# Description:
#   Get a fortune
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay fortune me - I'll post a 100% accurate fortune!
#
# Author:
#   mrtazz

module.exports = (robot) ->
  robot.respond /(fortune)( me)?/i, (msg) ->
    msg.http('http://www.fortunefortoday.com/getfortuneonly.php')
       .get() (err, res, body) ->
         msg.reply body
