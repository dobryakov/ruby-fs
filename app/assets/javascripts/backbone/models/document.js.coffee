class RubyFs.Models.Document extends Backbone.Model
  paramRoot: 'document'

  defaults:
    title: null
    file_url: null

class RubyFs.Collections.DocumentsCollection extends Backbone.Collection
  model: RubyFs.Models.Document
  url: '/documents'

  initialize: ->
    @bind("remove", @updateCounter)
    @bind("change", @updateCounter)
    @bind("reset",  @updateCounter)
    @bind("sync",   @updateCounter)
    @bind("add",    @updateCounter)

  updateCounter: ->
    @counterView = new RubyFs.Views.Documents.CounterView(collection: @)
    $("#documents-counter").html(@counterView.render().el)
