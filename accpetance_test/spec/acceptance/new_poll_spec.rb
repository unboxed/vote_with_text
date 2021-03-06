require_relative "./spec_helper"

describe "New Poll", type: :feature do
  before {
    visit "/polls/new"
  }

  it "returns html" do
    expect(page.response_headers['Content-Type']).to include('text/html')
  end

  it "contains a description textarea" do
    expect(page).to have_css("form textarea#description")
  end

  it "contains a welcome intro message" do
    expect(page).to have_css("div#welcome")
  end

  it "contains a submit button" do
    expect(page).to have_css("form button[type=\"submit\"]")
  end

  it "submits the form somewhere" do
    fill_in 'description', with: 'cuttlefish are cute'
    click_button 'Make Poll'

    expect(current_path).to match(/\/polls\/[a-z0-9-]+?/)
  end 
end

describe "Submitting a form", type: :feature do

  before do
    visit "/polls/new"
    fill_in 'description', with: 'lunch is good?'
    click_button 'Make Poll'
  end

  it "should display the topic description" do
    expect(page).to have_content('lunch is good?')
  end

  it "should persist the topic description between requests" do
    expect(page).to have_content('lunch is good?')

    visit current_path

    expect(page).to have_content('lunch is good?')
  end

end
