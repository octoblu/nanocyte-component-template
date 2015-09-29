ReturnValue = require 'nanocyte-component-return-value'
Template = require '../src/template'

describe 'Template', ->
  beforeEach ->
    @sut = new Template

  it 'should exist', ->
    expect(@sut).to.be.an.instanceOf ReturnValue

  describe '->onEnvelope', ->
    describe 'when called with an envelope', ->
      it 'should return the message', ->
        expect(@sut.onEnvelope({config: {template: "anything"}, message: 'somethingElse'})).to.deep.equal 'anything'
