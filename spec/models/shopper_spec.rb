# frozen_string_literal: true

# == Schema Information
#
# Table name: shoppers
#
#  id         :bigint           not null, primary key
#  email      :string
#  name       :string
#  nif        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "rails_helper"

xdescribe Shopper, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
