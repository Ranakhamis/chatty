class ElasticSearchIndexingJob
  include Sidekiq::Job
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  sidekiq_options queue: :index
  
  def perform
    unless Message.__elasticsearch__.index_exists?
      Message.__elasticsearch__.create_index! force: true,  ignore: 404
    end
      Message.import force: true
  end

end
