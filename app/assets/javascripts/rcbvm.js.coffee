window.Rcbvm =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  init: ->
    view = new Rcbvm.Views.InlineEditor.ToolbarView()
    $('body').prepend(view.render().el)
    @currentModels = {}

  getCurrentModel: (modelName) ->
    currentModel = @currentModels[modelName]
    if currentModel == undefined
      currentModel = new @Models.Item(modelName)
      @currentModels[modelName] = currentModel
    currentModel

$.ajaxSetup
  beforeSend: (xhr, settings) ->
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    return if (settings.crossDomain)
    return if (settings.type == "GET")
    if (csrf_token)
      xhr.setRequestHeader('X-CSRF-Token', csrf_token)

$(document).ready ->
  Rcbvm.init()
