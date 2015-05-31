# Description:
#   Get free advice from http://adviceslip.com/
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay what do you think about <topic> - I'll give you some advice on a specific topic.
#   @Hearsay I need some advice - I'll give you some general life advice!
#
# Author:
#   pengwynn
#
getAdvice = (msg, query) ->
  msg.http("http://api.adviceslip.com/advice/search/#{query}")
    .get() (err, res, body) ->
      results = JSON.parse body
      if results.message? then randomAdvice(msg) else msg.send(msg.random(results.slips).advice)

randomAdvice = (msg) ->
  msg.http("http://api.adviceslip.com/advice")
    .get() (err, res, body) ->
      results = JSON.parse body
      advice = if err then "You're on your own on this one." else results.slip.advice
      msg.send advice


module.exports = (robot) ->
  robot.respond /what (do you|should I) do (when|about) (.*)/i, (msg) ->
    getAdvice msg, msg.match[3]

  robot.respond /how do you handle (.*)/i, (msg) ->
    getAdvice msg, msg.match[1]

  robot.respond /(.*) some advice about (.*)/i, (msg) ->
    getAdvice msg, msg.match[2]

  robot.respond /(.*) think about (.*)/i, (msg) ->
    getAdvice msg, msg.match[2]

  robot.respond /(.*) advice$/i, (msg) ->
    randomAdvice(msg)
