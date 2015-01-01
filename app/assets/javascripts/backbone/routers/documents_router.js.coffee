class RubyFs.Routers.DocumentsRouter extends Backbone.Router
  initialize: (options) ->
    @documents = new RubyFs.Collections.DocumentsCollection()
    @documents.reset options.documents

  routes:
    "new"      : "newDocument"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newDocument: ->
    @view = new RubyFs.Views.Documents.NewView(collection: @documents)
    $("#documents").html(@view.render().el)

  index: ->
    @view = new RubyFs.Views.Documents.IndexView(collection: @documents)
    $("#documents").html(@view.render().el)

  show: (id) ->
    document = @documents.get(id)

    @view = new RubyFs.Views.Documents.ShowView(model: document)
    $("#documents").html(@view.render().el)

  edit: (id) ->
    document = @documents.get(id)

    @view = new RubyFs.Views.Documents.EditView(model: document)
    $("#documents").html(@view.render().el)
