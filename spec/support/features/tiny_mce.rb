module Features
  def tiny_mce_fill_in(name, options)
    page.execute_script("tinyMCE.get('#{name}').setContent('#{options[:with]}')")
  end
end
