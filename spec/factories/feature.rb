Factory.define :feature do |f|
  f.name 'Rails 3 base'
  f.feature 'Feature'
  f.description 'Applicatoin template based on rails 3'
  f.source_url 'http://github.com/fs/rails3-base'
  f.demo_url 'http://fs-rails3-base.heroku.com/'
  f.est '1'
  f.user {|a| a.association(:user) }
end
