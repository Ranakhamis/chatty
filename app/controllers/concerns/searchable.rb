module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings do
      mapping dynamic: false do
        indexes :content, type: :text, analyzer: :english
        indexes :chat_id
      end
    end

    def as_indexed_json(options={})
      self.as_json(only: [:content, :message_id, :chat_id])
    end

    def self.search(term, chat_id)
      response = __elasticsearch__.search(
          query: {
              bool: {
                  must: [
                      { match: { chat_id: chat_id } },
                      { query_string: { query: "*#{term}*", fields: [:content] } }
                  ]
              }
          }
      )
      response.results.map { |r| {content: r._source.content, chat_id: r._source.message_id} }
    end
  end
end