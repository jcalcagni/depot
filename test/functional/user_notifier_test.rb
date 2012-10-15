require 'test_helper'

class UserNotifierTest < ActionMailer::TestCase
  test "created" do
    mail = UserNotifier.created
    assert_equal "Created", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "updated" do
    mail = UserNotifier.updated
    assert_equal "Updated", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
