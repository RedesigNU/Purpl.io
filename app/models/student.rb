class Student < ActiveRecord::Base

  has_and_belongs_to_many :courses
  has_many :answers
  has_many :questions

  has_secure_password


end