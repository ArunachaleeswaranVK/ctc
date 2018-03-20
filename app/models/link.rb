class Link < ActiveRecord::Base
    validates :url , presence: true , uniqueness: true
    
    belongs_to :user
    has_many :comments
    
    def self.search(search)
        
        if search
           @tosearch = search.strip
           where(["url LIKE ?","%#{@tosearch}%"])
        else
           all
        end       
    end    

end
