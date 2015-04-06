sinon = require 'sinon'
expect = require './expect'

Helper = require('hubot-test-helper')
helper = new Helper('../scripts/trollbot.coffee')

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

  it "only recognizes full words", ->
    @room.user.say('testuser', "using gophers")
    @room.user.say('testuser', "using go")

    expect(@room.messages).to.deep.equal([
      ['testuser', "using gophers"],
      ['testuser', "using go"],
      ['hubot', "@testuser Hipster."]
    ])
