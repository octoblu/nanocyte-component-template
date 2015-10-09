_ = require 'lodash'
ReturnValue = require 'nanocyte-component-return-value'

class Template extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope
    {template, key} = config
    message = {}

    key = "text" if !key?

    _.set message, key, template
    return message

module.exports = Template
