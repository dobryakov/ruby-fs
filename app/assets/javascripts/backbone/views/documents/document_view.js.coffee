RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.DocumentView extends Backbone.View
  template: JST["backbone/templates/documents/document"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
