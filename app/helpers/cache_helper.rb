# frozen_string_literal: true

module CacheHelper
  #
  # Render cached partial
  #
  # @param [string] partial
  # @param [object] collection
  # @param [symbol] as
  # @param [hash] locals
  #
  # @return [mixed]
  #
  def render_cached_partial(partial:, collection:, as:, locals: nil)
    render partial: partial,
           collection: collection,
           as: as,
           cache: true,
           locals: locals
  end

  def partial_cache_key(object)
    CacheableService.call(object)
  end
end
