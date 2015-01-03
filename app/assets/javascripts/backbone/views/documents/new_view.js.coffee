RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.NewView extends Backbone.View
  template: JST["backbone/templates/documents/new"]

  events:
    "submit #new-document": "save"
    "change input[type=file]": "prepareUpload"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()
    @files = {}
    console.log "CONSTRUCTOR"
    console.log @model

    @model.bind("change:errors", () =>
      this.render()
    )

  prepareUpload: (event) ->
    @files = event.target.files;
    console.log @files

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    data = new FormData()
    $.each(@files, (key, value) -> data.append('document[file]', value))
    data.append('document[title]', $('#new-document #title').val())

    console.log @model

    $.ajax '/documents.json',
      type: 'POST'
      data: data
      cache: false
      dataType: 'json'
      processData: false
      contentType: false
      error: (jqXHR, textStatus, errorThrown) ->
        console.log textStatus
      success: (data, textStatus, jqXHR) ->
        @model = new RubyFs.Models.Document(data)
        console.log @model
        @collection.add(@model)
        #window.location.hash = "/#{@model.id}"

  createDocument: (data) ->
    console.log data

    ###
    @model.unset("errors")
    @model.unset("file")

    @collection.create(@model.toJSON(),
      success: (document) =>
        @model = document

        $.ajax({
          url: "/attach/#{@model.id}",
          type: 'POST',
          data: data,
          cache: false,
          dataType: 'multipart/form-data',
          processData: false,
          contentType: false,
          success: (data, textStatus, jqXHR) ->
            console.log textStatus
        })

        window.location.hash = "/#{@model.id}"

      error: (document, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )
    ###

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
