class TagsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource :resource => ActsAsTaggableOn::Tag

  # GET /tags
  def index
    @tags = Feature.all_tag_counts.all

    respond_to do |format|
      format.html # index.html.erb
      format.js { render :json => @tags.collect {|tag| {:caption => tag.name, :value => tag.name} }.to_json }
    end
  end

  # GET /tags/1/edit
  def edit
#    @tag = ActsAsTaggableOn::Tag.find(params[:id])
  end

  # PUT /tags/1
  def update
#    @tag = ActsAsTaggableOn::Tag.find(params[:id])

    respond_to do |format|
      if @tag.update_attributes(params[:tag])
        format.html { redirect_to(tags_path, :notice => 'Tag was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /tags/1
  def destroy
#    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @tag.destroy

    respond_to do |format|
      format.html { redirect_to(tags_url) }
    end
  end
end
