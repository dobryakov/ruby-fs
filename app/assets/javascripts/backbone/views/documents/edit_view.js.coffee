RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.EditView extends Backbone.View
  template: JST["backbone/templates/documents/edit"]

  events:
    "submit #edit-document": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (document) =>
        @model = document
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
