RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.IndexView extends Backbone.View
  template: JST["backbone/templates/documents/index"]

  initialize: () ->
    @collection.bind('reset', @addAll)

  addAll: () =>
    @collection.each(@addOne)

  addOne: (document) =>
    view = new RubyFs.Views.Documents.DocumentView({model : document})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(documents: @collection.toJSON() ))
    @addAll()

    return this
