class CommentNotifierObserver < ActiveRecord::Observer
  observe :comment
  
  def after_create(comment)
    send_comment_notification(comment) if comment.approved?
  end
  
  protected
    def send_comment_notification(comment)
      admin_email = comment.article.site.email
      CommentNotifier.deliver_comment_notification(admin_email, comment)
    end
end