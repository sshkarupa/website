require "application_system_test_case"

class ProfileTest < ApplicationSystemTestCase
  test "user uploads profile image" do
    user = create(:user)
    profile = create(:profile, user: user)

    sign_in!(user)
    visit profile_path(profile)
    click_on "Edit Public Profile"
    attach_file "user_avatar",
      "#{Rails.root}/test/fixtures/test.png",
      make_visible: true
    click_on "Update profile"

    assert_css "img[src*='test.png']"
  end
end
