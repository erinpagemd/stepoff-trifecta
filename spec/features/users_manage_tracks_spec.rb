feature "Users manage tracks" do
  before do
    pending
    signin_as Fabricate(:user)
  end

  scenario "viewing list of tracks" do
    Fabricate(:track, name: "Bathroom", distance: 0.1)
    Fabricate(:track, name: "Breakroom", distance: 0.15)
    Fabricate(:track, name: "Around the building", distance: 0.2)
    visit root_path
    click_on "Walking Tracks"
    current_path.should == "/tracks" # We wouldn't normally test the exact path
    within("ul#walking_tracks") do
      page.should have_css("li:nth-child(1)", text: "Around the building")
      page.should have_css("li:nth-child(2)", text: "Bathroom")
      page.should have_css("li:nth-child(3)", text: "Breakroom")
    end
  end

  scenario "happy path creating a track"
  scenario "sad path creating a track"
  scenario "happy path editing a track"
  scenario "sad path editing a track"
  scenario "deleting a path"
end
