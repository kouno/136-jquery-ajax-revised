FactoryGirl.define do
  sequence :task_name do |n|
    "task_#{n}"
  end
end

FactoryGirl.define do
  factory :task do
    name { generate(:task_name) }
    complete false
  end
end
