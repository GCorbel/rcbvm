window.Rcbvm =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}

  #Init the application
  init: ->
    #Create the toolbar, at the bottom
    view = new Rcbvm.Views.InlineEditor.ToolbarView()
    #Add the view at the top of the body
    $('body').prepend(view.render().el)
    #Init all the models as an empty list
    @currentModels = {}

  #Find or add a model to the current list
  getCurrentModel: (modelName) ->
    #Find the model
    currentModel = @currentModels[modelName]
    #If the model is not found
    if currentModel == undefined
      #Create a new own
      currentModel = new @Models.Item(modelName)
      #Add It to the list
      @currentModels[modelName] = currentModel
    #Return the model
    currentModel

#Send the csrf token before an ajax send for rails
$.ajaxSetup
  beforeSend: (xhr, settings) ->
    csrf_token = $('meta[name="csrf-token"]').attr('content')
    return if settings.crossDomain
    return if settings.type == "GET"
    if csrf_token
      xhr.setRequestHeader('X-CSRF-Token', csrf_token)

#Init the backbone application when jQuery is ready
$(document).ready ->
  Rcbvm.init()
