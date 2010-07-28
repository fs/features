module ApplicationHelper
  include ActsAsTaggableOn::TagsHelper

  def title(page_title, show_title = true)
    @show_title = show_title
    content_for(:title) { page_title.to_s }
  end

  def show_title?
    @show_title
  end

  def markup(text)
    textilize(auto_link(text))
  end

  def links_to_tags(object)
    return '' if object.tags.blank?
    object.tags.collect do |tag|
      link_to(tag.name, by_tag_features_path(:tag => tag.name))
    end.join(', ').html_safe
  end
end
