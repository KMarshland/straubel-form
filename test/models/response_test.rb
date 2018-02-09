# == Schema Information
#
# Table name: responses
#
#  id         :integer          not null, primary key
#  session    :uuid
#  view       :uuid
#  answers    :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  email      :string
#  name       :string
#  campaign   :string
#
# Indexes
#
#  index_responses_on_session  (session)
#  index_responses_on_view     (view)
#

require 'test_helper'

class ResponseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
