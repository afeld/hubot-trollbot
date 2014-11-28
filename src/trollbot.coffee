# Description:
#   A hubot script that annoys your coworkers.
#
# Commands:
#   mongodb - Share the love.

module.exports = (robot) ->
  robot.respond /hi/, (msg) ->
    msg.reply 'hello'

  robot.hear /mongodb/i, (msg) ->
    msg.reply "MongoDB is web scale."
