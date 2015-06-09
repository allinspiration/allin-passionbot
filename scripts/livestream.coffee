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
#   @Hearsay livestream - I'll post a link to the official [ALLIN] live stream.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /livestream$/i, (msg) ->
    msg.send "[ALLIN] Live Stream | Twitch: http://twitch.tv/allinspiration | Hitbox.tv: http://hitbox.tv/allinlive (Less Delay) | Beam.pro: http://beam.pro/allin (Quality Options)"
