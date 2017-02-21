require 'rails_helper'

RSpec.describe Goal, type: :model do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:privacy) }
  it { should validate_presence_of(:completed) }

  it { should belong_to(:user) }

  it "defaults to private" do
    goal = Goal.new
    expect(goal.privacy).to eq('private')
  end

  it "defaults completed to false" do
    goal = Goal.new
    expect(goal.completed).to eq(false)
  end

  
end
