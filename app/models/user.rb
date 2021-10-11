class User < ApplicationRecord
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :username, presence: true, length: { minimum: 3 }
    has_many :books 

    def full_name
        return [first_name, last_name].compact.join(' ')
    end
end
