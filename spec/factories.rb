FactoryGirl.define do
  factory :project_user do
    project nil
    user nil
    access_level 1
  end
  factory :project do
    token ""
    owner_id 1
    title "MyString"
    description "MyString"
    start_date "2017-08-03 17:24:51"
    end_date "2017-08-03 17:24:51"
  end
  factory :user do
    
  end
end
