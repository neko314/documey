# frozen_string_literal: true

require "test_helper"

class SeminarTest < ActiveSupport::TestCase
  setup do
    @seminar = seminars(:seminar1)
  end

  test "seminar is valid" do
    seminar = Seminar.new(start_at: "2018-01-01 10:00",
                          finish_at: "2018-1-01 12:00",
                          place: "conference room",
                          title: "brush up listening skill",
                          theme: "hearing and listening",
                          point: 5)
    assert seminar.valid?
  end

  test "seminar is invalid without start_at" do
    @seminar.start_at = ""
    assert @seminar.invalid?
  end

  test "seminar is invalid without finish_at" do
    @seminar.finish_at = ""
    assert @seminar.invalid?
  end

  test "seminar is invalid without place" do
    @seminar.place = ""
    assert @seminar.invalid?
  end

  test "seminar is invalid without title" do
    @seminar.title = ""
    assert @seminar.invalid?
  end

  test "seminar is invalid without theme" do
    @seminar.theme = ""
    assert @seminar.invalid?
  end

  test "seminar is invalid without point" do
    @seminar.point = ""
    assert @seminar.invalid?
  end
end
