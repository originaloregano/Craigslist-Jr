require 'securerandom'

class Article < ActiveRecord::Base
  include SecureRandom

  belongs_to :category

  validates :title, :body, :email, :category_id, presence: true

  before_create :make_key

  def make_key
    self.key = SecureRandom.urlsafe_base64[0..5]
  end
end
