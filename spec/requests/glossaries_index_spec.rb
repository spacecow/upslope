require 'spec_helper'

describe "Glossaries" do
  describe "index" do
    it "lists a glossary" do
      Factory(:glossary)
      visit glossaries_path
      table(0).should == ["factory english","factory japanese","factory explanation ja","factory example en","factory example ja","Edit"] 
    end

    it "list glossaries in order" do
      Factory(:glossary, :en => "second", :level => 2)
      Factory(:glossary, :en => "first", :level => 1)
      visit glossaries_path
      table(0,0).should have_content("first") 
      table(1,0).should have_content("second") 
    end

    it "link to edit page" do
      glossary = Factory(:glossary) 
      visit glossaries_path
      click_link "Edit"
      page.current_path.should == edit_glossary_path(glossary)
    end

    it "link to new page" do
      visit glossaries_path
      click_link "New Glossary"
      page.current_path.should == new_glossary_path
    end

    context "sort links for" do
      before(:each) do
        visit glossaries_path
      end
  
      it "English" do
        click_link "English"
      end

      it "Japanese" do
        click_link "Japanese"
      end

      it "Explanation (ja)" do
        click_link "Explanation (ja)"
      end

      it "Example (en)" do
        click_link "Example (en)"
      end

      it "Example (ja)" do
        click_link "Example (ja)"
      end
    end
  end
end
