class Article < ActiveRecord::Base
    #La tabla => articles
    #Campos => ActiveRecord, article.title()
    #Escribir métodos
    belongs_to :user
    has_many :comments
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true , length: {minimum:20, maximum:10000}
    before_save :set_visits_count 

    def update_visits_count
        self.save if self.visits_count.nil?
        #Le decimos, el contador es nulo? pues llama a self.save(que esto va al hash before_save y llama a set visits count)
        self.update(visits_count: self.visits_count + 1)
    end
    private

    def set_visits_count
        self.visits_count ||= 0
        #or o igual, si el valor de visits count es nulo le asigna 0, sino es nulo no le asigna nada.
    end
end
