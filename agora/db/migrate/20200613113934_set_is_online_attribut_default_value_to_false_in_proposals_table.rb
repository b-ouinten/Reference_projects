class SetIsOnlineAttributDefaultValueToFalseInProposalsTable < ActiveRecord::Migration[5.2]
  def change
    change_column :proposals, :is_online, :boolean, :default => false
  end
end
