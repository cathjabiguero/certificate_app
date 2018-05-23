class Owner < ApplicationRecord
  validates :title,
            :subtitle, 
            :recipient_name, 
            :first_paragraph, 
            :second_paragraph, 
            :first_assignatory_name, 
            :first_assignatory_position, 
            presence: true #validation
            
  default_scope { order("created_at DESC")} #descending order of records

  dragonfly_accessor :logo  

  def self.import(csv_file, logo)
    CSV.foreach(csv_file.path, headers: true, header_converters: :symbol) do |row|
      Owner.create! row.to_hash.merge(logo: logo)
    end
  end

end
