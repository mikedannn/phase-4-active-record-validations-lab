class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: ["Fiction", "Non-Fiction"]}
    validate :is_clickbait

    def is_clickbait
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess" || "True Facts")
            errors.add(:title, 'Your title is not clickbait-y')
        end
    end
end
