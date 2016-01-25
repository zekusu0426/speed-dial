# == Schema Information
#
# Table name: bookmarks
#
#  id         :integer          not null, primary key
#  url        :string
#  title      :string
#  image      :string
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bookmarks_on_user_id  (user_id)
#

class Bookmark < ActiveRecord::Base
  belongs_to :user

  # title,urlを追加するときは必須です。
  validates :title,:url ,presence: true
end
