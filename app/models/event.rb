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

class Event < ApplicationRecord

  validates :session, presence: true
  validates :view, presence: true
  validates :time, presence: true
  validates :kind, presence: true

end
