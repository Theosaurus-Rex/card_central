require 'rails_helper'

RSpec.describe "listings/index", type: :view do
  before(:each) do
    new_user = User.create!(
      name: "Bob Marley",
      email: "email@address.com",
      password: "Password1"
    )
    assign(:listings, [
      Listing.create!(
        title: "Title",
        description: "MyText",
        price: "",
        sold: false,
        user: new_user
      ),
      Listing.create!(
        title: "Title",
        description: "MyText",
        price: "",
        sold: false,
        user: new_user
      )
    ])
  end

  it "renders a list of listings" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "MyText".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: false.to_s, count: 2
  end
end
