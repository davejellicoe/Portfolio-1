class Post < ActiveRecord::Base
  # TODO: this line was absent in the example posts.rb on Mon, 10/21. For learning about scope
  attr_accessible :content, :title, :published

  validates :title, :content, presence: true
  validates :title, length: { in: 2..255 }
  validates :content, length: { in: 3..255 }


  belongs_to :author, class_name: "User"
  # scope published, where(published: true)

  # TODO: we added this on Mon, 10/21. For learning about scope
  # belongs_to :author, class_name: "User"
  # scope :published, where(published: true)

  # # TODO: we added this on Mon, 10/21.  For a reminder of class vs instance methods.
  # # class method
  # def self.published
  #   where(published: true)
  # end

  # # TODO: we added this on Mon, 10/21.  For a reminder of class vs instance methods.
  # # instance method
  # def publish!
  #   self.published = true
  #   save!
  # end


  # def publish!
  #   published = true
  #   save!
  # end
end
