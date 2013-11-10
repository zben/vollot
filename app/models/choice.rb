class Choice < ActiveRecord::Base
  has_many :votes
  belongs_to :poll

  after_create :remove_empty_choice

  default_scope order(created_at: :asc)

  def remove_empty_choice
    self.delete if content.empty?
  end
end
