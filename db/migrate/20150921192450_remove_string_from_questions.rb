class RemoveStringFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :string, :string
    remove_column :questions, :string, :string
  end
end
