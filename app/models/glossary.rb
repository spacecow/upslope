class Glossary < ActiveRecord::Base
  validates_presence_of :date, :level

  def date_format; date && date.strftime("%b.%e") end
end
