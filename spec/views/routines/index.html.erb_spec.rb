require 'rails_helper'

RSpec.describe "routines/index", type: :view do
  before(:each) do
    assign(:routines, [
      Routine.all
    ])
  end

  it "renders a list of routines" do
    render

    expect(response.body).to include("Routine One")
    expect(response.body).to include("Routine Two")
  end
end
