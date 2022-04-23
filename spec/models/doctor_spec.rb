require 'rails_helper'

RSpec.describe Doctor, type: :model do
  before do
    @doctor1 = create(:doctor)
  end

  it "is valid with valid attributes" do
    expect(@doctor1).to be_valid
  end

  it "has a unique phone number" do
    doctor2 = build(:doctor)
    expect(doctor2).not_to be_valid
  end

  it "must include only numbers" do
    doctor2 = build(:doctor, phone: "098765432q")
    expect(doctor2).not_to be_valid
  end

  it "should include 10 numbers" do
    doctor2 = build(:doctor, phone: "098765432")
    expect(doctor2).not_to be_valid
  end

  it "can not be nil or empty" do
    doctor2 = build(:doctor, phone: nil)
    expect(doctor2).not_to be_valid
    doctor2 = build(:doctor, phone: "")
    expect(doctor2).not_to be_valid
  end
end
