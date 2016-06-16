module Features
  def login_to_admin_as(admin)
    visit optimadmin.login_path
    fill_in "Email or Username", with: admin.username
    fill_in "Password", with: admin.password
    click_button "Log In"
  end

  def have_admin_index(content)
    have_css ".module-list-index", text: content
  end

  def disable_tabs
    page.execute_script("$('.tabs').tabs('destroy')")
  end
end
