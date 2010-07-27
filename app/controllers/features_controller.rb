class FeaturesController < ApplicationController
  navigation :features
  before_filter :authenticate_user!

  # GET /features
  def index
    @features = Feature.all

    respond_to do |format|
      format.html # index.html.erb
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
end
