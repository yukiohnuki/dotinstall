require 'active_record'
ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "./blog.db"
)

class Post < ActiveRecord::Base
	#scope :top3, order("created_at").limit(3)
    has_many :comments, :dependent => :destroy
end

class Comment < ActiveRecord::Base
    belongs_to :post
end

p Post.all
p Comment.all

Post.find(1).destroy

p Post.all
p Comment.all


=begin
post = Post.find(1)
post.comments.each do |comment|
	p comment.body
end
=end



#Post.where(:id => 1..2).delete_all
#Post.find(3).destroy
#p Post.all



#post = Post.find(1)
=begin
post.title = "(new)title1"
post.save
=end

#post.update_attribute(:title, "(new2)title1")
#post.update_attributes(:title => "nnn", :body => "hhh")

#Post.where(:id => 1..2).update_all(:title => "nnn2", :body => "hhh2")

#p Post.all

#post = Post.new(:title => "title1", :body => "hello1")

=begin
post = Post.new
post.title = "title2"
post.body = "hello2"
=end
=begin
post = Post.new do |p|
	p.title = "title3"
	p.body = "hello3"
end
post.save
=end

#Post.create(:title => "title4", :body => "hello4")

#p Post.all
#p Post.first
#p Post.last.title
#p Post.find_by_title("title2")
#p Post.find_by_title_and_id("title2",3)

#p Post.where(:title => "title1", :id => 1)
#p Post.where("title = ? and id = ?","title1",1)
#p Post.where("title = :title and id = :id",{:title => "title1", :id => 1})

#p Post.where("id > ?",2)

#p Post.where("body like ?", "hello%")

#p Post.where(:id => 1..3)
#p Post.where(:id => [1,3])

#p Post.order("id desc").limit(3)

#p Post.top3

#p Post.where(:title => "title5").first_or_create
#Post.where(:title => "title6").first_or_create do |p|
	#p.body = "hello6"
#end
#p Post.all