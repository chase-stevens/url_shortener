require 'test_helper'

class UrlsControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "should create a new url" do
    url = Url.new
    assert url.save
  end

  test "should retrieve existing url" do
    url = Url.new
    url.short = "https://www.amazon.com/Ruby-Under-Microscope-Illustrated-Internals/dp/1593275277"
    assert_not url.save, "Saved a duplicated URL"
  end
end
