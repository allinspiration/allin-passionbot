# Description:
#   Magic Eight Ball
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   Hearsay 8ball <query> - Ask the magic eight ball a question
#
# Author:
#   Myriad Truths

ball = [
  "Signs point to yes.",
  "Yes.",
  "Without a doubt.",
  "My sources say no.",
  "As I see it, yes.",
  "You may rely on it.",
  "It is decidedly so.",
  "Better not tell you now.",
  "Very doubtful.",
  "Yes - definitely.",
  "It is certain.",
  "Most likely.",
  "My reply is no.",
  "Don't count on it.",
  "Yes, in due time.",
  "Definitely not.",
  "You will have to wait.",
  "I have my doubts.",
  "Outlook so so.",
  "Looks good to me!",
  "Who knows?",
  "Looking good!",
  "Probably.",
  "Are you kidding?",
  "Go for it!",
  "Don't bet on it.",
  "Forget about it.",
  "Fuck off.",
]

module.exports = (robot) ->
  robot.respond /(eightball|8ball)(.*)/i, (msg) ->
    msg.reply msg.random ball
    
    

