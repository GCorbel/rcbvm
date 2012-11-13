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

  save_changes: (event) ->
    $.each(Rcbvm.currentModels, (key, model) ->
      model.save()
    )

  cancel_changes: (event) ->
    window.location.reload()

  toggle_editing_mode: ->
    if $('.save').is(':hidden')
      @$('.save').show()
      @$('.cancel').show()
      Aloha.active()
    else
      @$('.save').hide()
      @$('.cancel').hide()
      Aloha.deactive()
