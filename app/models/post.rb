class Post < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :content, length: { minimum: 250}
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: ["Fiction", "Non-Fiction"]

    validate :title_include

    def title_include

     unless title && title.include?("Won't Believe" ||  "Secret" || "Top [number]" || "Guess")
        errors.add(:title, "Title must be clickbait-y") 
      end
      # if title && !title.include?("Won't Believe" ||  "Secret" || "Top [number]" || "Guess")
      #   errors.add(:title, "Title must be clickbait-y") 
      # end
    end


end