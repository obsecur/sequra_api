# frozen_string_literal: true

# == Schema Information
#
# Table name: merchants
#
#  id         :bigint           not null, primary key
#  cif        :string
#  email      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :merchant do
    name { "MyString" }
    email { "MyString" }
    cif { "MyString" }
  end
end
