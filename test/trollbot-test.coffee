sinon = require 'sinon'
expect = require './expect'

describe 'trollbot', ->
  beforeEach ->
    @robot = require('./testrobot')()
    require('../src/trollbot')(@robot)

  it 'replies to a hello', ->
    @robot.sendText('Hubot: hi')
    expect(@robot.sent).to.deep.equal(['testuser: hello'])

  describe "love and hate", ->
    it "responds to a hate message", ->
      @robot.sendText("I cant stand MongoDB")
      expect(@robot.sent).to.deep.equal(["testuser: But MongoDB is web scale!"])

    it "ignores a love message", ->
      @robot.sendText("boy do I love MongoDB")
      expect(@robot.sent).to.deep.equal([])
