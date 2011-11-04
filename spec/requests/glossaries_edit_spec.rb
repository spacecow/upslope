require 'spec_helper'

describe "Glossaries" do
  describe "edit" do
    before(:each) do
      @glossary = Factory(:glossary)
      visit edit_glossary_path(@glossary)
    end

    it "should have fields filled in" do
      find_field("glossary_date_1i").value.should == "2011"
      find_field("glossary_date_2i").value.should == "11"
      find_field("glossary_date_3i").value.should == "4"
      find_field("English").value.should == "factory english"  
      find_field("Japanese").value.should == "factory japanese"  
      find_field("Explanation (ja)").value.should == "factory explanation ja"
      find_field("Example (en)").value.should == "factory example en"
      find_field("Example (ja)").value.should == "factory example ja"
      find_field("Level").value.should == "1"
    end

    it "should edit a glossary" do
      lambda do
        select "2012", :from => "glossary_date_1i"
        fill_in "English", :with => "new english"
        fill_in "Japanese", :with => "new japanese"
        fill_in "Explanation (ja)", :with => "new explanation ja"
        fill_in "Example (en)", :with => "new example en"
        fill_in "Example (ja)", :with => "new example ja"
        fill_in "Level", :with => "2"
        click_button "Update Glossary"
      end.should change(Glossary, :count).by(0)
      g = Glossary.last
      g.date.should == Date.parse("2012-11-4")
      g.en.should == "new english"
      g.ja.should == "new japanese"
      g.explanation_ja.should == "new explanation ja"
      g.example_en.should == "new example en"
      g.example_ja.should == "new example ja"
      g.level.should == 2
    end
  end
end
