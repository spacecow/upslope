require 'spec_helper'

describe "Glossaries" do
  describe "new" do
    before(:each) do
      visit new_glossary_path
    end

    it "should have empty fields" do
      find_field("English").value.should be_nil
      find_field("Japanese").value.should be_nil
      find_field("Explanation (ja)").value.should be_nil
      find_field("Example (en)").value.should be_nil
      find_field("Example (ja)").value.should be_nil
    end

    it "should edit a glossary" do
      lambda do
        fill_in "English", :with => "new english"
        fill_in "Japanese", :with => "new japanese"
        fill_in "Explanation (ja)", :with => "new explanation ja"
        fill_in "Example (en)", :with => "new example en"
        fill_in "Example (ja)", :with => "new example ja"
        click_button "Create Glossary"
      end.should change(Glossary, :count).by(1)
      g = Glossary.last
      g.en.should == "new english"
      g.ja.should == "new japanese"
      g.explanation_ja.should == "new explanation ja"
      g.example_en.should == "new example en"
      g.example_ja.should == "new example ja"
    end
  end
end
