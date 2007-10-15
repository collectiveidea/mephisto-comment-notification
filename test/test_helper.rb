# As you can see you'll need to run these tesxts in the context of a Rals application
# as it requires the whole environment to be loaded.'

require 'test/unit'
require File.join(File.dirname(__FILE__), 'ptk_helper')
require 'test_help'

require 'stubs/site'
require 'stubs/content'
require 'stubs/comment'
require 'stubs/article'
require 'mephisto_comment_notification'

Rails::Initializer.run do |config|
  config.active_record.observers = :comment_notifier_observer
end

$:.unshift(File.join(File.dirname(__FILE__), '../lib/'))