class Micropost < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc )}
  # mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, 
                      length: { maximum: 140 }  
  validates :picture_size
  has_many :bookmarks, dependent: :destroy

  private

  def picture_size
    if picture_size > 1.megabytes
      errors.add(:picture, "file size is over")
    end
  end

  def bookmark(user)
    bookmarks.create(user_id: user.id)
  end

  # マイクロポストのいいねを解除する（ネーミングセンスに対するクレームは受け付けません）
  def rmbookmark(user)
    bookmarks.find_by(user_id: user.id).destroy
  end

end
