require 'rails_helper'

describe User, type: :model do
  it "can be created as an admin" do
    user = User.create(username: "danny", password: "123", role: 1)

    expect(user.role).to eq("admin")
    expect(user.admin?).to be_truthy
  end

  it "can be created as a default user" do
    user = User.create(username: "phil", password: "grateful", role: 0)

    expect(user.role).to eq("default")
    expect(user.default?).to be_truthy
  end
end
