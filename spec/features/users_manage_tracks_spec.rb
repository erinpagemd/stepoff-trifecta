feature "Users manage tracks" do
  before do
    signin_as Fabricate(:user)
  end

  scenario "viewing track list when empty" do
    visit root_path
    click_on "Walking Tracks"
    page.should have_content("There aren't any tracks yet.  You should add one!")
    page.should_not have_content("Sort")
  end

  scenario "viewing list of tracks" do
    Fabricate(:track, name: "Bathroom", distance: 0.15)
    Fabricate(:track, name: "Around the building", distance: 0.2)
    Fabricate(:track, name: "Breakroom", distance: 0.1)
    visit root_path
    click_on "Walking Tracks"
    current_path.should == "/tracks" # We wouldn't normally test the exact path
    within("ul#walking_tracks") do
      page.should have_css("li:nth-child(1)", text: "Around the building, 0.2 mile")
      page.should have_css("li:nth-child(2)", text: "Bathroom, 0.15 mile")
      page.should have_css("li:nth-child(3)", text: "Breakroom, 0.1 mile")
    end
    page.should_not have_css("a", text: "Sort: Alphabetical")
    page.should have_content("Sort: Alphabetical")
    click_on "Sort: Length"
    within("ul#walking_tracks") do
      page.should have_css("li:nth-child(1)", text: "Breakroom, 0.1 mile")
      page.should have_css("li:nth-child(2)", text: "Bathroom, 0.15 mile")
      page.should have_css("li:nth-child(3)", text: "Around the building, 0.2 mile")
    end
    page.should_not have_css("a", text: "Sort: Length")
    page.should have_content("Sort: Length")
    click_on "Sort: Alphabetical"
    within("ul#walking_tracks") do
      page.should have_css("li:nth-child(1)", text: "Around the building, 0.2 mile")
      page.should have_css("li:nth-child(2)", text: "Bathroom, 0.15 mile")
      page.should have_css("li:nth-child(3)", text: "Breakroom, 0.1 mile")
    end
  end

  scenario "happy path creating a track"
  scenario "sad path creating a track"
  scenario "happy path editing a track"
  scenario "sad path editing a track"
  scenario "deleting a path"
end
