require 'rails_helper'

RSpec.describe Patient do
  it { should have_many :doctors_patients }
  it { should have_many(:doctors).through(:doctors_patients) }

  it '#adult_patients' do
    #add orderly? to test only adding 18+ year olds and in alphabetical order
  end
end
