class ClickbaitValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
      record.errors.add attribute, "Not a clickbait title"
    end
  end
end

class Post < ActiveRecord::Base
  validates :title, presence: true
<<<<<<< HEAD
  validates :title, clickbait: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
=======
  validate :clickbait, true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validates :category
  
  def clickbait
    unless value =~ /(Won't Believe|Secret|Top \d|Guess)/
      record.errors[attribute] << ("Not a clickbait title")
    end
  end
>>>>>>> 2dee5c38e20ed6dd214f2a3abf523e4d49a262c4
  
end

