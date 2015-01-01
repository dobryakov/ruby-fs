RubyFs.Views.Documents ||= {}

class RubyFs.Views.Documents.CounterView extends Backbone.View
  template: JST["backbone/templates/documents/counter"]
  tagName: 'span'

  render: ->
    @$el.html(@template(@model))
    return this
