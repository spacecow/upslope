class GlossariesController < ApplicationController
  before_filter :sort_glossaries, :only => :index
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource

  def show
    respond_to do |f|
      f.json {render :json => @glossary.to_json}
    end
  end

  def index
    respond_to do |f|
      f.html
      f.json {render :json => @glossaries.to_json}
    end 
  end

  def new
    @glossary.date = Date.today
  end

  def create
    if @glossary.save
      redirect_to glossaries_path
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
      date = params[:date]
      if date 
        if data = date.match(/(\d*)\/(\d*)\/(\d*)/)
          date = "20#{data[1]}-#{data[3]}-#{data[2]}" 
        end
        return @glossaries = Glossary.where(:date=>date).order(sort_column+" "+sort_direction)
      end 
      @glossaries = Glossary.order(sort_column+" "+sort_direction)
    end

    def sort_column
      Glossary.column_names.include?(params[:sort]) ?  params[:sort] : 'en'
    end
    def sort_direction
      %w(asc desc).include?(params[:direction]) ?  params[:direction] : 'asc'
    end
end
