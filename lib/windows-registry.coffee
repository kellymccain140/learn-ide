Registry = require 'winreg'

module.exports = {
  registerProtocol: ->
    regConfig = [
      {key: '\\learn-ide', name: '', value: 'URL:learn-ide Protocol'},
      {key: '\\learn-ide', name: 'URL Protocol', value: ''},
      {key: '\\learn-ide\\shell\\open\\command', name: '', value: "#{process.execPath} \"%1\""}
    ]


    regConfig.forEach (config) ->
      reg = new Registry({hive: Registry.HKCR, key: config.key})

      reg.create(->
        reg.set config.name, Registry.REG_SZ, config.value, ->
          console.log("Registered key #{config.key}: #{config.name}: #{config.value}")
      )
}
