class AddSummaryToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :summary, :text
  end
end
