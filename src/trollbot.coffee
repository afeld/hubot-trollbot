# Description:
#   A hubot script that annoys your coworkers.
#
# Commands:
#   mongodb - Share the love.

getHaterRegex = (term) ->
  ///
    (
      hate
      | can'?t\s+stand
      | loathe
      | despise
    )
    \s+
    #{term}
  ///i


module.exports = (robot) ->
  robot.respond /hi/, (msg) ->
    msg.reply 'hello'

  robot.hear getHaterRegex('mongo'), (msg) ->
    msg.reply "But MongoDB is web scale!"
