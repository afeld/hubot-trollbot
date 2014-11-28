# Description:
#   A hubot script that annoys your coworkers.
#
# Commands:
#   mongodb - Share the love.

getLoverRegex = (term) ->
  ///
    (
      love
      | used
      | using
    )
    \s+
    #{term}
  ///i


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

  robot.hear getLoverRegex('mongo(db)?'), (msg) ->
    msg.reply "Hipster."

  robot.hear getHaterRegex('mongo(db)?'), (msg) ->
    msg.reply "MongoDB is web scale!"
