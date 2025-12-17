class AddShowWelcomeMessageToUsers < ActiveRecord::Migration[8.1]
  def change
  add_column :users, :show_welcome_message, :boolean, default: true
  end
end
