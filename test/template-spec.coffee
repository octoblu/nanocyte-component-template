ReturnValue = require 'nanocyte-component-return-value'
Template = require '../src/template'

describe 'Template', ->
  beforeEach ->
    @sut = new Template

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with a template and no key', ->
      beforeEach ->
        @response =
          text: 'anything'
        @envelope =
          config:
            template: "anything"
            key: null
          message: "somethingElse"

      it 'should return the message with the key defaulted to text', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal @response

    describe 'when called with a template and a key', ->
      beforeEach ->
        @response =
          atemplate: 'anything'
        @envelope =
          config:
            template: "anything"
            key: "atemplate"
          message: "somethingElse"

      it 'should return the message with the key assigned', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal @response

    describe 'when called with a blank template and a key', ->
      beforeEach ->
        @response =
          atemplate: null
        @envelope =
          config:
            template: null
            key: "atemplate"
          message: "somethingElse"

      it 'should return the message with the key assigned', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal @response

    describe 'when called with a template and a deep key', ->
      beforeEach ->
        @response =
          nested:
            squirrel: 'HI'

        @envelope =
          config:
            template: 'HI'
            key: 'nested.squirrel'

      it 'should return the message with the key assigned', ->
        expect(@sut.onEnvelope(@envelope)).to.deep.equal @response
