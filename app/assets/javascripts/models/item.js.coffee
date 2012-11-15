#This is a generic class for all the models
class Rcbvm.Models.Item extends Backbone.Model
  #Take the plural name of the model and at it to urlRool
  #When the save method is called, an ajax request is sent at the controller
  initialize: (plural) ->
    @urlRoot = "/#{plural}"
