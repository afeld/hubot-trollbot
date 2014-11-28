sinon = require 'sinon'
expect = require './expect'

describe 'trollbot', ->
  beforeEach ->
    @robot = require('./testrobot')()
    require('../src/trollbot')(@robot)

  it 'replies to a hello', ->
    @robot.sendText('Hubot: hi')
    expect(@robot.sent).to.deep.equal(['testuser: hello'])

  it 'hears a mention', ->
    @robot.sendText('boy do I love MongoDB')
    expect(@robot.sent).to.deep.equal(["testuser: MongoDB is web scale."])
