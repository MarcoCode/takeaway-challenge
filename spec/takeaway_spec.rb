require 'takeaway'

describe Takeaway do
  
  subject(:takeaway)    { described_class.new }
  
  describe 'Allows user to order' do
    
    
    it 'gets the answer for the cuisine type' do
      
      allow(takeaway).to receive(:get_choice) {"1"}
      expect(takeaway.get_choice).to eq "1"
    end
  end
  
  describe "#order" do
    
    it 'stores an item into the order' do
      
      takeaway.order("pizza", 2)
      expect(takeaway.order_log.status).to include({"Pizza"=> 10.0})
      
    end
    
    it 'stores items in hashes' do
      
      takeaway.order("pasta")
      expect(takeaway.order_log.status.last).to be_an Hash
    end
  end
  
  describe '#check_out' do
    
    it 'Does not finalises the order if total inputted is not correct' do
      takeaway.order("pasta")
      expect(takeaway.check_out 34).to eq "The total is not correct or no order has been made!"
    end
    
  end
  

end