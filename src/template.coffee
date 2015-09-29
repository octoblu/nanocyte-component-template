ReturnValue = require 'nanocyte-component-return-value'

class Template extends ReturnValue
  onEnvelope: (envelope) =>
    {config} = envelope
    message = config.template
    return message

module.exports = Template
