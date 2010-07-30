require 'ostruct'

class FeaturesController < ApplicationController
  navigation :features
  before_filter :authenticate_user!, :except => [:index, :by_tag, :show]
  before_filter :load_tags

  # GET /features
  def index
    @features, @search = search(Feature.includes(:tags))

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /features/by_tag?tag=tag_name
  def by_tag
    @features = Feature.tagged_with(params[:tag]).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html
    end
  end

  # GET /features/1
  def show
    @feature = Feature.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
    end
  end

  # GET /features/new
  def new
    @feature = Feature.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  # GET /features/1/edit
  def edit
    @feature = Feature.find(params[:id])
  end

  # POST /features
  def create
    @feature = Feature.new(params[:feature])

    respond_to do |format|
      if @feature.save
        format.html { redirect_to(features_path, :notice => 'Feature was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /features/1
  def update
    @feature = Feature.find(params[:id])

    respond_to do |format|
      if @feature.update_attributes(params[:feature])
        format.html { redirect_to(features_path, :notice => 'Feature was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /features/1
  def destroy
    @feature = Feature.find(params[:id])
    @feature.destroy

    respond_to do |format|
      format.html { redirect_to(features_url) }
    end
  end

  private

  def load_tags
    @tags = Feature.tag_counts_on(:tags)
  end
end
