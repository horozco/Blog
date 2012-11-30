FactoryGirl.define do
  factory :user do
      sequence(:full_name) {|n| "Alguien_ #{n}"}
      sequence(:email) {|n| "a_a#{n}@b.com"}
      password "password"
  end

  factory :post do
    #pertenece a un usuario
    user
    title "post for test"
    content "this is my content for this post example"

    factory :invalid_post do
        title ""
    end
  end

  factory :comment do
    #pertenece a un post
    post
    commenter "a nickname"
    body " a body for the comment"

    factory :invalid_comment do
      body ""
    end
  end

  factory :user_comment do
    #pertenece a un post
    post
    user
    commenter "a nickname"
    body " a body for the comment"

    factory :invalid_user_comment do
      body ""
    end
  end

  factory :anonymous_comment do
    #pertenece a un post
    post
    commenter "a nickname"
    body " a body for the comment"

    factory :invalid_anonymous_comment do
      body ""
    end
  end
end

  