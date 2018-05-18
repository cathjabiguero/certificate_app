
require 'spec_helper'
RSpec.describe Owner, type: :model do
  subject(:owner) { Owner.new(title: 'test title', 
                          subtitle: 'test subtitle', 
                          recipient_name: 'test name',
                          first_paragraph: 'test firstpar',
                          second_paragraph: 'test secondpar',
                          first_assignatory_name: 'test assgnname',
                          first_assignatory_position: 'test assgnpos') }

  context 'validations' do
    it "is not valid without a title" do
      subject.title = nil
      expect(subject).to_not be_valid
    end
  end
end

