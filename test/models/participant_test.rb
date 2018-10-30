require 'test_helper'

class ParticipantTest < ActiveSupport::TestCase

  setup do
    @participant = participants(:participant1)
  end

  test "participant is valid" do
    participant = Participant.new(name: "test",
                                  membership_number: "XYZ111111",
                                  email: "test@example.com",
                                  seminar_id: 1)
    assert participant.valid?
  end

  test "membership number is valid with 3 large characters and 6 integers" do
    @participant.membership_number = "ABC123456"
    assert @participant.valid?
  end

  test "membership number is valid when blank" do
    @participant.membership_number = ""
    assert @participant.valid?
  end

  test "membership number is invalid without character" do
    @participant.membership_number = "1" * 6
    assert @participant.invalid?
  end

  test "membership number is invalid with little chatacters" do
    @participant.membership_number = "a" * 3 + "1" * 6
    assert @participant.invalid?
  end

  test "membership number is invalid when characters are longer than three" do
    @participant.membership_number = "A" * 4 + "1" * 6
    assert @participant.invalid?
  end

  test "membership number is invalid when characters are shorter than three" do
    @participant.membership_number = "A" * 2 + "1" * 6
    assert @participant.invalid?
  end

  test "membership number is invalid when integers are longer than six" do
    @participant.membership_number = "A" * 3 + "1" * 7
    assert @participant.invalid?
  end

  test "membership number is invalid when integers are shorter than six" do
    @participant.membership_number = "A" * 3 + "1" * 5
    assert @participant.invalid?
  end

  test "membership number is invalid when it's not unique" do
    @participant.membership_number = "ABC123456"
    @participant.save
    other_participant = Participant.new(name: "test",
                                        membership_number: "",
                                        email: "test@example.com",
                                        seminar_id: 1)
    other_participant.membership_number = "ABC123456"
    assert other_participant.invalid?
  end

  test "participant is invalid without name" do
    @participant.name = ""
    assert @participant.invalid?
  end

  test "email is invalid when is not unique" do
    @participant.email = "participant@example.com"
    @participant.save
    other_participant = Participant.new(name: "test",
                                        membership_number: "EFG123456",
                                        email: "",
                                        seminar_id: 1)
    other_participant.email = "participant@example.com"
    assert other_participant.invalid?
  end
end
