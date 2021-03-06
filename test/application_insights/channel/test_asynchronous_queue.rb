require_relative '../../../lib/application_insights/channel/sender_base'
require_relative '../../../lib/application_insights/channel/asynchronous_queue'
require 'test/unit'

include ApplicationInsights::Channel

class TestAsynchronousQueue < Test::Unit::TestCase
  def test_initialize
    queue = AsynchronousQueue.new MockAsynchronousSender.new
    assert_not_nil queue.flush_notification
  end

  def test_flush_notification_works_as_expected
    queue = AsynchronousQueue.new MockAsynchronousSender.new
    assert_not_nil queue.flush_notification
    result = queue.flush_notification.wait 1
    assert_equal false, result
    queue.flush_notification.set
    result = queue.flush_notification.wait
    assert_equal true, result
    queue.flush_notification.clear
    result = queue.flush_notification.wait 1
    assert_equal false, result
  end

  def test_push_works_As_expected
    sender = MockAsynchronousSender.new
    queue = AsynchronousQueue.new sender
    queue.push 42
    assert_equal 1, sender.start_call_count
    assert_equal 42, queue.pop
    assert_nil queue.pop
  end

  def test_flush_works_as_expected
    sender = MockAsynchronousSender.new
    queue = AsynchronousQueue.new sender
    assert_not_nil queue.flush_notification
    result = queue.flush_notification.wait 1
    assert_equal false, result
    queue.flush
    assert_equal 1, sender.start_call_count
    result = queue.flush_notification.wait
    assert_equal true, result
  end
end

class MockAsynchronousSender
  def initialize
    @send_buffer_size = 2
    @data = []
    @queue = nil
    @start_call_count = 0
  end

  attr_accessor :start_call_count
  attr_accessor :send_buffer_size
  attr_accessor :data
  attr_accessor :queue

  def start
    @start_call_count += 1
  end

  def send(data_to_send)
    @data.push data_to_send
  end
end