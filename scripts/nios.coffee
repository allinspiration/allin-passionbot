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
#   Hearsay nios - I'll post links Nios.kr ranking information.
#
# Author:
#   Myriad Truths

module.exports = (robot) ->
	robot.respond /nios$/i, (msg) ->
    msg.send "[ALLIN] Nios.kr Rankings | NA: http://nios.kr/sc2/us/clan/detail/AIlin | EU: http://nios.kr/sc2/eu/clan/detail/AIlin | SEA: http://nios.kr/sc2/sea/clan/detail/Allin | KR: http://nios.kr/sc2/kr/clan/detail/Allin"
		
		