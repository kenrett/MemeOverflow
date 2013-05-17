Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "299766628021.apps.googleusercontent.com", ENV['GOOGLE_SECRET'],
             {
             :scope => "userinfo.email,userinfo.profile,plus.me,http://gdata.youtube.com",
             :approval_prompt => "auto"
           }
end

