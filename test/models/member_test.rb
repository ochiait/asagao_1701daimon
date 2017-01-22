# encoding: UTF-8
require 'test_helper'

class MemberTest < ActiveSupport::TestCase

  def setup
    @members = [
      FactoryGirl.create(:member, name: "tanaka", full_name: "Tanaka Jiro", number: 1),
      FactoryGirl.create(:member, name: "yamada", full_name: "Yamada Taro", number: 2),
      FactoryGirl.create(:member, name: "yamamoto", full_name: "Yamamoto Hanako", number: 3),
      FactoryGirl.create(:member, name: "suzuki", full_name: "Suzuki Saburo", number: 4)
    ]
  end

  test "factory girl" do
    member = FactoryGirl.create(:member, number:5)
    assert_equal "Yamada Taro", member.full_name
  end

  test "結果は０" do
    results = Member.search("c")
    assert_equal 0, results.length
  end

  test "山田で検索" do
    results = Member.search("yamada")
    assert_equal 1, results.length
    assert_equal "Yamada Taro", results[0].full_name
  end

  test "山で検索" do
    results = Member.search("yama")
    assert_equal 2, results.length
    assert_equal "Yamada Taro", results[0].full_name
    assert_equal "Yamamoto Hanako", results[1].full_name
  end
end
