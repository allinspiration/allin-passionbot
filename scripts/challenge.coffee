
# Description:
#   Posts a URL to a Typeform for processing clan war requests.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay challenge me - I'll post a link to a form you can give to people outside the team who want to talk to us.
#
# Author:
#   MyriadTruths

module.exports = (robot) ->
  robot.respond /(challenge )( me)?/i, (msg) ->
    msg.send "Someone requesting a Clan War? Direct them to this form and we'll get back to them: https://goo.gl/372Al7"
