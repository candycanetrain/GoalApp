require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) do
    FactoryGirl.build(:user,
      username: "ryley",
      password: "good_password")
  end

  it { should validate_presence_of(:username)}
  it { should validate_presence_of(:password_digest)}
  it { should validate_presence_of(:session_token)}
  it { should validate_uniqueness_of(:username)}
  it { should validate_uniqueness_of(:session_token)}
  it { should validate_length_of(:password).is_at_least(6)}

  it { should have_many(:goals)}

  describe "User::find_by_credentials" do
    before { user.save!}

    it "returns user given good credentials" do
      expect(User.find_by_credentials("ryley", "good_password")).to eq(user)
    end
    it "returns nil if bad credentials" do
      expect(User.find_by_credentials("ryley", "bad_password")).to eq(nil)
    end
  end

end
