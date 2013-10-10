FactoryGirl.define do
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