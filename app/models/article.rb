class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  has_attached_file :photo
  # validates :photo, attachment_presence: true
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

  def slug_candidates
    [
      :title,
      [:title, :subtitle],
      [:title, :subtitle, Time.now.to_i]
    ]
  end
end
