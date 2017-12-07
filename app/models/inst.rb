class Inst < ActiveRecord::Base
    belongs_to :user
    geocoded_by :address
    after_validation :geocode
    # CommentモデルのAssociationを設定
    has_many :comments, dependent: :destroy
    mount_uploader :image, ImageUploader
end
