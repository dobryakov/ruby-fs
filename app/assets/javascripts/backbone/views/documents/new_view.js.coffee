RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.NewView extends Backbone.View
  template: JST["backbone/templates/documents/new"]

  events:
    "submit #new-document": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (document) =>
        @model = document
        window.location.hash = "/#{@model.id}"

      error: (document, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
