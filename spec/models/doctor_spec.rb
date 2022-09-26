require 'rails_helper'

RSpec.describe Doctor do
  it { should belong_to :hospital }
  it { should have_many :doctors_patients }
  it { should have_many(:patients).through(:doctors_patients) }
end
