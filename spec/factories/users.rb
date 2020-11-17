FactoryBot.define do
  factory :user do
    nickname              { 'yuki' }
    email                 { 'kkk@gmail.com' }
    password              { 'hoge11' }
    password_confirmation { password }
    last_name { 'ゆうき' }
    first_name { 'とみまつ' }
    last_name_kana { 'ユウキ' }
    first_name_kana { 'トミマツ' }
    birth_date { '2000-01-01' }
  end
end
