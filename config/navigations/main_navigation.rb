SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'main'
    primary.item :features, 'Features', features_path, :if => Proc.new { can?(:read, Feature) }
    primary.item :unapproved_features, 'Unapproved features', unapproved_features_path, :if => Proc.new { can?(:read, Feature) && user_signed_in? }
    primary.item :tsgs, 'Tags', tags_path, :if => Proc.new { can? :read, ActsAsTaggableOn::Tag }
  end
end