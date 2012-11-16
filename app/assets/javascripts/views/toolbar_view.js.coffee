Rcbvm.Views.InlineEditor ||= {}

class Rcbvm.Views.InlineEditor.ToolbarView extends Backbone.View

  template: JST['toolbar_views']

  events:
    'click .editing-mode': 'toggle_editing_mode'
    'click .save': 'save_changes'
    'click .cancel': 'cancel_changes'

  render: ->
    super
    $(@el).html(@template())
    @$('.save').hide()
    @$('.cancel').hide()
    @

# commit all changes for all stored model
  save_changes: (event) ->
    Editor.commitAll()
    $.each(Rcbvm.currentModels, (key, model) ->
      model.save()
    )
    Rcbvm.currentModels = {}

# reload the page to cancel all change
  cancel_changes: (event) ->
    window.location.reload()

# toggle the editing mode
  toggle_editing_mode: ->
    if $('.save').is(':hidden')
      @$('.save').show()
      @$('.cancel').show()
      Editor.active()
    else
      @$('.save').hide()
      @$('.cancel').hide()
      Editor.deactive()
