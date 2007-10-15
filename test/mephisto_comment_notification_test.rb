require File.expand_path(File.dirname(__FILE__) + '/test_helper')

class CommentCreationTest < Test::Unit::TestCase
  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    
    @deliveries = ActionMailer::Base.deliveries
    Site.destroy_all
    @site = Site.create(:email => 'contact@lukeredpath.co.uk')
    @article = Article.create(:title => "My great post")
    @comment = Comment.new(
      :author => 'Luke Redpath',
      :author_ip => '127.0.0.1',
      :article_id => @article.id
    )
    @comment.save
  end
  
  def test_should_trigger_an_email_notification_to_site_administrator
    assert_equal 1, @deliveries.size
    assert_equal "[Mephisto] A new comment has been posted for '#{@article.title}'", @deliveries.first.subject
    assert @deliveries.first.to.include?("contact@lukeredpath.co.uk")
  end
end
