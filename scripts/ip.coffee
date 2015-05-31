# Description:
#  IP Check
#
# Dependencies:
#   None
#
# Configuration:
#  None
# 
# Commands:
#   Hearsay ip - Returns Hearsay's external IP address.
#
# Author:
#   Myriad Truths
     
module.exports = (robot) ->
  robot.respond /ip/i, (msg) ->
    msg.http("http://jsonip.com")
      .get() (err, res, body) ->
        json = JSON.parse(body)
        switch res.statusCode                                
          when 200
            msg.send "My current WAN IP address is #{json.ip}."
          else
            msg.send "There was an error getting external IP (status: #{res.statusCode})."
                

