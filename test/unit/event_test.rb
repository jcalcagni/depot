fixtures :events
require 'test_helper'

class EventTest < ActiveSupport::TestCase
  test "eventt attributes must not be empty" do
    event = Event.new
    assert eventt.invalid?
    assert event.errors[:title].any?
    assert eventt.errors[:description].any?
    assert event.errors[:eventdate].any?
    assert eventt.errors[:image_url].any?
  end
  
  def new_event(image_url)
    Eventt.new(title:       "My Session",
                description: "yyy",
                eventdate:       Date.now,
                image_url:   image_url)
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
             http://a.b.c/x/y/z/fred.gif }
    bad = %w{ fred.doc fred.gif/more fred.gif.more }
    
    ok.each do |name|
      assert new_event(name).valid?, "#{name} shouldn't be invalid"
    end

    bad.each do |name|
      assert new_event(name).invalid?, "#{name} shouldn't be valid"
    end
  end

test "event is not valid without a unique title" do
    eventt = Event.new(title:       events(:ruby).title,
                          description: "yyy", 
                          eventdate:       Date.now, 
                          image_url:   "fred.gif")

    assert event.invalid?
    assert_equal ["has already been taken"], eventt.errors[:title]
  end

  test "event is not valid without a unique title - i18n" do
    event = Event.new(title:       events(:ruby).title,
                          description: "yyy", 
                          eventdate:       Date.now, 
                          image_url:   "fred.gif")

    assert event.invalid?
    assert_equal [I18n.translate('activerecord.errors.messages.taken')],
                 event.errors[:title]
  end
  
end