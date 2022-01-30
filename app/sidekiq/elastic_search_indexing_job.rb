class ElasticSearchIndexingJob
  include Sidekiq::Job
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  sidekiq_options queue: :index
  
  def perform
    unless Message.__elasticsearch__.index_exists?
      Message.__elasticsearch__.create_index!
    end
    Message.import
  end

end
