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
  dragonfly_accessor :qr_code
  
  def self.import(file, logo)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      profile = Owner.new row.to_hash.merge(logo: logo)

      #add qr code before saving
      qr_code_img = RQRCode::QRCode.new(profile.recipient_name, :size => 20, :level => :h).to_img
      profile.qr_code = qr_code_img.to_string
      profile.save!
    end
  end
  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when '.csv' then Roo::CSV.new(file.path)
      when '.xls' then Roo::Excel.new(file.path)
      when '.xlsx' then Roo::Excelx.new(file.path)
      else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.to_csv(options={}) #export csv and excel
    CSV.generate(options) do |csv|
      csv << ["TITLE","SUBTITLE","RECIPIENT NAME","FIRST PARAGRAPH","SECOND PARAGRAPH","FIRST ASSIGNATORY NAME","FIRST ASSIGNATORY POSITION"]
      all.each do |owner|
        csv << [owner.title, owner.subtitle, owner.recipient_name, owner.first_paragraph, owner.second_paragraph, owner.first_assignatory_name, owner.first_assignatory_position]
      end
    end
  end

  def self.search(search)
    where("recipient_name LIKE ?", "%#{search}%" )
  end
end
