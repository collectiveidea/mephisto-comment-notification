require 'comment_notifier'
require 'comment_notifier_observer'

ActiveRecord::Base.observers << :comment_notifier_observer
