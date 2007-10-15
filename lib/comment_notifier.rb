class CommentNotifier < ActionMailer::Base
  include Mephisto::Liquid::UrlMethods
  
  self.template_root = File.dirname(__FILE__) + '/views'
  
  def comment_notification(recipient, comment)
    recipients      recipient
    from            recipient
    subject         "[Mephisto] A new comment has been posted for '#{comment.article.title}'"
    body            "comment" => comment
  end
end
