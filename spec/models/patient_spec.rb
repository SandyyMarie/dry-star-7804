require 'rails_helper'

RSpec.describe Patient do
  it { should have_many :doctors_patients }
  it { should have_many(:doctors).through(:doctors_patients) }
end
