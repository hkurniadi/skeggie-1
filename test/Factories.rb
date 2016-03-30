FactoryGirl.define do
  factory :course do
    
  end
    factory :user do |f|
        f.id 1
        f.username "Cody"
        f.password "testing"
        f.password_confrimation "testing"
    end
end