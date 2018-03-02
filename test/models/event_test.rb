# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  session    :uuid
#  view       :uuid
#  time       :datetime
#  question   :string
#  kind       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  campaign   :string
#
# Indexes
#
#  index_events_on_session  (session)
#  index_events_on_view     (view)
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
