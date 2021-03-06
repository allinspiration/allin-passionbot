# Description:
#   Simulates dice rolls of x-sided die.
#
# Dependencies:
#   None
#
# Configuration:
#   None
#
# Commands:
#   @Hearsay roll <x>d<y> - I'll roll x amount of y-sided dice and report the results.
#
# Author:
#   None

module.exports = (robot) ->
  robot.respond /roll (\d+)d(\d+)/i, (msg) ->
    dice = parseInt msg.match[1]
    sides = parseInt msg.match[2]
    answer = if sides < 1
      "Roll a zero-sided die? Are you crazy?"
    else if dice > 100
      "I'm not going to roll more than 100 dice for you."
    else
      report roll dice, sides
    msg.reply answer

report = (results) ->
  if results?
    switch results.length
      when 0
        "I didn't roll any dice."
      when 1
        "I rolled a #{results[0]}."
      else
        total = results.reduce (x, y) -> x + y
        finalComma = if (results.length > 2) then "," else ""
        last = results.pop()
        "I rolled #{results.join(", ")}#{finalComma} and #{last}, making #{total}."

roll = (dice, sides) ->
  rollOne(sides) for i in [0...dice]

rollOne = (sides) ->
  1 + Math.floor(Math.random() * sides)
