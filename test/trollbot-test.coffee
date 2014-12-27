sinon = require 'sinon'
expect = require './expect'

Helper = require('hubot-test-helper')
helper = new Helper('../src/trollbot.coffee')

describe 'trollbot', ->
  beforeEach ->
    @room = helper.createRoom()

  it "suggests contrary languages", ->
    @room.user.say('testuser', "we used Ruby")
    expect(@room.messages).to.deep.equal([
      ['testuser', "we used Ruby"],
      ['hubot', "@testuser You should rewrite it in Go."]
    ])

  it "responds to a hate message", ->
    @room.user.say('testuser', "I cant stand MongoDB")
    expect(@room.messages).to.deep.equal([
      ['testuser', "I cant stand MongoDB"],
      ['hubot', "@testuser MongoDB is web scale!"]
    ])

  it "responds to a love message", ->
    @room.user.say('testuser', "boy do I love MongoDB")
    expect(@room.messages).to.deep.equal([
      ['testuser', "boy do I love MongoDB"],
      ['hubot', "@testuser Hipster."]
    ])
