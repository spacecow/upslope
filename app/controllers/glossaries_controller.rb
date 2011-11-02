class GlossariesController < ApplicationController
  before_filter :sort_glossaries, :only => :index
  load_and_authorize_resource

  def index
    respond_to do |f|
      f.html
      f.json {render :json => @glossaries.to_json}
    end 
  end

  def edit
  end

  def update
    if @glossary.update_attributes(params[:glossary])
      redirect_to glossaries_path
    end
  end

  private
    
    def sort_glossaries
      @glossaries = Glossary.order(:level)
    end
end
