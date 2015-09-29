# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  title      :string
#  body       :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ActiveRecord::Base
    
    belongs_to :user
    has_many :answers
  
    validates :title, presence: true, length: {maximum: 100}
    validates :body, presence: true
  
end
