class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'


  private

  def search(scope, per_page = 10)
    params[:search] ||= {}

    return scope.search_for(params[:search][:query]).paginate(:per_page => per_page, :page => params[:page]),
      ::OpenStruct.new(:query => params[:search][:query])
  end
end
