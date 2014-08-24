# Description
#   A Hubot script that say "それ SIer ぽいですね。"
#
# Dependencies:
#   None
#
# Configuration:
#   HUBOT_SIER_PATTERNS
#
# Commands:
#   None
#
# Author:
#   bouzuya <m@bouzuya.net>
#
module.exports = (robot) ->
  DEFAULT_PATTERNS = '["Excel","スク(?:リーン)?ショ(?:ット)?","チェックシート"]'
  robot.hear /.*/i, (res) ->
    patternsString = process.env.HUBOT_SIER_PATTERNS ? DEFAULT_PATTERNS
    patterns = JSON.parse(patternsString).map (pattern) ->
      new RegExp(pattern, 'i')
    res.send 'それ SIer ぽいですね。' if patterns.some (pattern) ->
      res.match[0].match pattern
