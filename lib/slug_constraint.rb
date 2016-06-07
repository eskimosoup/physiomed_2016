class SlugConstraint
  def initialize(model)
    @model = model
  end

  def matches?(request)
    slug_exists?(request)
  end

  private

  attr_reader :model

  def slug_exists?(request)
    requested_slug = request.path_parameters[:id]

    if uses_friendly_id_table?
      FriendlyId::Slug.where(sluggable_type: model.to_s).exists?(slug: requested_slug)
    else
      model.exists?(slug: requested_slug)
    end
  end

  def uses_friendly_id_table?
    model.included_modules.include?(FriendlyId::History)
  end
end
