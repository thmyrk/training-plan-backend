class TagPresenter < BasePresenter
  def initialize(tag)
    @tag = tag
  end

  def basic
    tag = {}
    tag[:id] = @tag.id
    tag[:name] = @tag.name
    tag[:created_at] = @tag.created_at
    tag[:updated_at] = @tag.updated_at
    tag
  end
end
