module.exports = (robot) ->
  robot.respond /what is the saddest thing (.*)/i, (msg) ->
    msg.send "The Tale Of Smith by Xy Hapu | http://www.insanefruits.net/v_002/histories/smith/"
	
