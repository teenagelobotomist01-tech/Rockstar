class AddHideWelcomeMessageToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :hide_welcome_message, :boolean
  end
end
