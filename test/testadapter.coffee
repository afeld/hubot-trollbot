hubot = require('hubot')
Adapter = hubot.Adapter


# https://github.com/github/hubot/blob/7b39d7c39f6c1d8a95c6a14b02ae265679740b05/test/tests.coffee#L54-L68
class TestAdapter extends Adapter
  send: (user, strings...) ->
    for str in strings
      @robot.sent.push str
      @robot.recipients.push user

  reply: (envelope, strings...) ->
    for str in strings
      @send envelope, "#{envelope.user.name}: #{str}"


exports.use = (robot) ->
  new TestAdapter(robot)
