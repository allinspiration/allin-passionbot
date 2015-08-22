# Description:
#   Get some nifty wallpapes.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay wallpaper me - I'll post a link to a nifty [ALLIN] wallpaper you can use on your computer!
#
# Author:
#   mrtazz

module.exports = (robot) ->
  robot.respond /(wallpaper )( me)?/i, (msg) ->
    msg.send "Allin-ify your desktop! | http://i.imgur.com/dIsHjiJ.jpg"
