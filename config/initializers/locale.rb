I18n.load_path += Dir[Rails.root.join('locales', '*.{rb,yml}')]

I18n.available_locales = [:en, :de]

I18n.default_locale = :en