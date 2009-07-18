# (very) basic class definition
class Comment < ActiveRecord::Base ; belongs_to :post ; end
class Post < ActiveRecord::Base ; has_many :comments ; end