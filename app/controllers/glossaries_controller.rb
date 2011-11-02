class GlossariesController < ApplicationController
  def index
    respond_to do |f|
      @glossaries = Glossary.all 
      f.json {render :json => @glossaries.to_json}
    end 
  end
end
