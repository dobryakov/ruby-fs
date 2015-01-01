json.array!(@documents) do |document|
  json.extract! document, :id, :title
  json.url document_url(document, format: :json)
end
