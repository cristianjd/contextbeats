FactoryGirl.define do
  factory :user do
    name "example"
    password "foobar"
    password_confirmation "foobar"
  end

  factory :post do
    title "Lorem Ipsum"
    content "Lorem Ipsum"
  end

  factory :comment do
    commenter "Lorem Ipsum"
    body "Lorem Ipsum"
    post
  end
end