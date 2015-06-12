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
#   @Hearsay horse - I'll post an..."insight" from @horse_ebooks. 
#
# Author:
#   lavelle

module.exports = (robot) ->
    robot.respond /horse/i, (msg) ->
        url = 'http://api.twitter.com/1/statuses/user_timeline.json'
        msg
            .http(url)
            .query
                screen_name: 'horse_ebooks'
                count: 10
            .get() (err, res, body) ->
                tweets = JSON.parse(body)

                if tweets? and tweets.length > 0
                    n = Math.floor Math.random() * tweets.length or 0
                    msg.send(tweets[n].text)
                else
                    msg.reply "Oops. You broke it."
