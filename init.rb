require 'mephisto_comment_notification'

ActionController::Base.send(:observer, :comment_notifier_observer)