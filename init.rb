require 'mephisto_comment_notification'

# this doesn't seem to be working for some reason
# so lets just send the observer to actioncontroller
#
#config.active_record.observers = :comment_notifier_observer

ActionController::Base.send(:observer, :comment_notifier_observer)