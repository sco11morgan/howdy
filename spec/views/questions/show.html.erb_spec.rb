require 'rails_helper'

RSpec.describe "questions/show", type: :view do
  before(:each) do
    assign(:question, Question.create!(
      message: "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
  end
end
