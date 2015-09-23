class RemoveTextFromQuestions < ActiveRecord::Migration
  def change
    remove_column :questions, :text, :string
  end
end
