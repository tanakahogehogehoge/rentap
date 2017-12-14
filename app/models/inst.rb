class Inst < ActiveRecord::Base
    belongs_to :user
    geocoded_by :address
    after_validation :geocode
    validates :address, presence: true
    validates :cost, numericality: { only_integer: true, greater_than: 0 }
    validates :cost, presence: true
    validates :style, presence: true
    validates :info, length: { in: 20..1200 }
    # CommentモデルのAssociationを設定
    has_many :comments, dependent: :destroy
    mount_uploader :image, ImageUploader
    mount_uploader :image2, Image2Uploader
    mount_uploader :image3, Image3Uploader
    mount_uploader :image4, Image4Uploader
end
