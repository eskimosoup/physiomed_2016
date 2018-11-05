class SearchFacade
  def initialize(query)
    @query = query
  end

  def results
    @results ||= PgSearch.multisearch(query).includes(:searchable)
  end

  private

  attr_reader :query
end
