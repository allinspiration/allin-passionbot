# Description:
#   Hearsay randomly selects from given options.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay decide <option1> <option2> <option3> - I'll choose between options you give me!
#
# Author:
#   logikal
#   streeter

module.exports = (robot) ->
    robot.respond /decide "(.*)"/i, (msg) ->
        options = msg.match[1].split('" "')
        msg.reply("Definitely \"#{ msg.random options }\".")

    robot.respond /decide ([^"]+)/i, (msg) ->
        options = msg.match[1].split(' ')
        msg.reply("Definitely \"#{msg.random options}\".")
