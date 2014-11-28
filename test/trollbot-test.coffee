sinon = require 'sinon'
expect = require './expect'

describe 'trollbot', ->
  beforeEach ->
    @robot = require('./testrobot')()
    require('../src/trollbot')(@robot)

  it 'replies to a hello', ->
    @robot.sendText('Hubot: hi')
    expect(@robot.sent).to.deep.equal(['testuser: hello'])

  it "suggests contrary languages", ->
    @robot.sendText('we used Ruby')
    expect(@robot.sent).to.deep.equal(["testuser: You should rewrite it in Go."])

  it "responds to a hate message", ->
    @robot.sendText("I cant stand MongoDB")
    expect(@robot.sent).to.deep.equal(["testuser: MongoDB is web scale!"])

  it "responds to a love message", ->
    @robot.sendText("boy do I love MongoDB")
    expect(@robot.sent).to.deep.equal(["testuser: Hipster."])
