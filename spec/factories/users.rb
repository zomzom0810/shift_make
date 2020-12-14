FactoryBot.define do
    factory :user do
      user_name             {"suzuki"}
      password              {"tanaka123"}
      password_confirmation {password}
      name                  {"田中タロウ"}
      name_kana             {"タナカタロウ"}
      position_id           { 3 }
    end
  end