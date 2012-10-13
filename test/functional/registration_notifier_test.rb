require 'test_helper'

class RegistrationNotifierTest < ActionMailer::TestCase
  test "received" do
    mail = RegistrationNotifier.received(registrations(:one))
    assert_equal "Verteo Biopharma Registration Confirmation", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /Verteo Session 1/, mail.body.encoded
  end

  test "shipped" do
    mail = RegistrationNotifier.shipped(registrations(:one))
    assert_equal "Verteo Biopharma Packet Shipped", mail.subject
    assert_equal ["dave@example.org"], mail.to
    assert_equal ["depot@example.com"], mail.from
    assert_match /<td>1&times;<\/td>\s*<td>Verteo Session 1<\/td>/,
      mail.body.encoded
  end

end
