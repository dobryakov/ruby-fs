RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.ShowView extends Backbone.View
  template: JST["backbone/templates/documents/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
