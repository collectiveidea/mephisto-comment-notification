require File.expand_path(File.dirname(__FILE__) + '/test_helper')
require 'comment_notifier'

class CommentNotificationTest < Test::Unit::TestCase
  def setup
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
    
    @article = Article.create(:title => "My great post")
    @comment = Comment.new(
      :author => 'Luke Redpath',
      :author_ip => '127.0.0.1',
      :article_id => @article.id
    )
    @comment.save
    @notification = CommentNotifier.create_comment_notification("contact@lukeredpath.co.uk", @comment)
  end
  
  def test_should_be_sent_to_specified_recipient
    assert @notification.to.include?("contact@lukeredpath.co.uk")
  end
  
  def test_should_send_details_of_comment_in_mail_body
    body = "A new comment has been posted on your blog for the article '#{@article.title}' by #{@comment.author}.\n\n"
    body << "Commenter IP address is #{@comment.author_ip}."
    assert_equal body, @notification.body
  end
  
  def test_should_send_the_comment_article_title_in_the_mail_subject
    assert_equal "[Mephisto] A new comment has been posted for '#{@article.title}'", @notification.subject
  end

  private
    def read_fixture(action)
      IO.readlines("#{FIXTURES_PATH}/comment_notification/#{action}")
    end

    def encode(subject)
      quoted_printable(subject, CHARSET)
    end
end
