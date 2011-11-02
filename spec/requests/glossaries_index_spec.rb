require 'spec_helper'

describe "Glossaries" do
  describe "GET /glossaries" do
    it "works" do
      get glossaries_path
      response.status.should be(200)
    end

    it "list glossaries in order" do
      Factory(:glossary, :en => "second", :level => 2)
      Factory(:glossary, :en => "first", :level => 1)
      visit glossaries_path
      li(0).should have_content("first") 
      li(1).should have_content("second") 
    end

    it "link to edit page" do
      glossary = Factory(:glossary) 
      visit glossaries_path
      click_link "Edit"
      page.current_path.should == edit_glossary_path(glossary)
    end
  end
end
