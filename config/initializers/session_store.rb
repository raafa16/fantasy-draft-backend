if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: "_fantasy_draft_app", domain: "fantasy-draft-backend.herokuapp.com"
else
  Rails.application.config.session_store :cookie_store, key: "_fantasy_draft_app"
end
