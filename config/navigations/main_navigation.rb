SimpleNavigation::Configuration.run do |navigation|  
  navigation.autogenerate_item_ids = false

  navigation.items do |primary|
    primary.dom_class = 'main'
    primary.item :features, 'Features', features_path

    primary.with_options(:if => Proc.new { user_signed_in? }) do |signed_in_user|
      signed_in_user.item :tags, 'Tags', tags_path
    end
  end
end