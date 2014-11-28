hubot = require('hubot')
Robot = hubot.Robot
TextMessage = hubot.TextMessage


# https://github.com/github/hubot/blob/7b39d7c39f6c1d8a95c6a14b02ae265679740b05/test/tests.coffee#L37-L52
class TestRobot extends Robot
  constructor: ->
    super __dirname, 'testadapter'
    @sent = []
    @recipients = []

  loadAdapter: ->
    @adapter = require('./testadapter').use @

  sendText: (text) ->
    user = {name: 'testuser'}
    msg = new TextMessage(user, text, '123')
    @receive(msg)


module.exports = ->
  robot = new TestRobot()
  robot.on 'error', (err) ->
    throw new Error(err)
  robot
