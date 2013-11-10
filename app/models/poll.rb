class Poll < ActiveRecord::Base
  has_many :choices
  accepts_nested_attributes_for :choices, allow_destroy: true

  before_create :generate_permalink

  def generate_permalink
    self.permalink = random_permalink
  end

  def random_permalink
    attempt = 3.times.map{ random_letter }.sum
    if Poll.where(permalink: attempt).present?
      generate_permalink
    else
      attempt
    end
  end

  def random_letter
    (65 + rand(26)).chr
  end

  def to_json
    choices.to_json
  end

  def qr_url_prefix
    "http://chart.apis.google.com/chart?chld=L|0&cht=qr&chs=300x300&chl="
  end
end
