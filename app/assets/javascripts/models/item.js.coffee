class Rcbvm.Models.Item extends Backbone.Model
  initialize: (plural) ->
    @urlRoot = "/#{plural}"
