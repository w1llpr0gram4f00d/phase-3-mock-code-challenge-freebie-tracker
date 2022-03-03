class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie dev, item_name, value
        self.freebies.create(dev_id: dev.id, company_id: self.id, item_name: item_name, value: value)
    end

    def self.oldest_company
        self.all.minimum(:founding_year)
    end
end
