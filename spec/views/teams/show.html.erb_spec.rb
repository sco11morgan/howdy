require 'rails_helper'

RSpec.describe "teams/show", type: :view do
  before(:each) do
    assign(:team, Team.create!(
      name: "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
  end
end
