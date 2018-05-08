class Owner < ApplicationRecord
    validates :title, :subtitle, :recipient_name, :first_paragraph, :second_paragraph, :first_assignatory_name, :first_assignatory_position,
                                                            presence: true #validation
    dragonfly_accessor :logo                                                        
end
