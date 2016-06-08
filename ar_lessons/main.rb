require 'active_record'
ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "./blog.db"
)

class Post < ActiveRecord::Base
	scope :top3, order("created_at").limit(3)
end

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

p Post.top3