require 'comment_notifier'
require 'comment_notifier_observer'

ActiveRecord::Base.observers << :comment_notifier_observer
ActionController::Base.append_view_path(File.dirname(__FILE__) + '/lib/views')
