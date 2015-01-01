class RubyFs.Models.Document extends Backbone.Model
  paramRoot: 'document'

  defaults:
    title: null

class RubyFs.Collections.DocumentsCollection extends Backbone.Collection
  model: RubyFs.Models.Document
  url: '/documents'
