# Description:
#   A hubot script that annoys your coworkers.
#
# Commands:
#   i love mongodb - Share the love.

getUsingRegex = (term) ->
  ///
    (
      used
      | using
      |
        (
          written
          | wrote\s+it
        )
        \s+
        in
    )
    \s+
    (#{term})\b
  ///i

getLoverRegex = (term) ->
  ///
    (
      love
      | used
      | using
    )
    \s+
    (#{term})\b
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
    (#{term})\b
  ///i


module.exports = (robot) ->
  robot.hear getUsingRegex('ruby|python|java'), (msg) ->
    msg.reply "You should rewrite it in Go."

  robot.hear getLoverRegex('mongo(db)?|go|clojure|riak|nosql'), (msg) ->
    msg.reply "Hipster."

  robot.hear getHaterRegex('mongo(db)?'), (msg) ->
    msg.reply "MongoDB is web scale!"
