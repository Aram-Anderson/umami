require 'rails_helper'

RSpec.describe Item, type: :model do
  it {should validate_presence_of :name}
  it {should validate_uniqueness_of :name}
  it {should validate_presence_of :description}
  it {should validate_uniqueness_of :description}
  it {should validate_presence_of :price}
  
end
