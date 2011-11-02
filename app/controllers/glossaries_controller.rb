class GlossariesController < ApplicationController
  def index
    @glossaries = Glossary.order(:level) 
    respond_to do |f|
      f.html
      f.json {render :json => @glossaries.to_json}
    end 
  end
end
