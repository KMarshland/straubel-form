class AddCampaignToResponse < ActiveRecord::Migration[5.1]
  def change
    add_column :responses, :campaign, :string
  end
end
