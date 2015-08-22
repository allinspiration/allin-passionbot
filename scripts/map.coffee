
# Description:
#   Posts a URL to a google map collection of user-provided locations.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay map me - I'll post a link to a map of the Earth overlayed with the locations of Allin members!
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /(map )( me)?/i, (msg) ->
    msg.send "[ALLIN] GeoMap | http://goo.gl/G6CwOr | Send a manager your city/state/province/whatever to be added!"
