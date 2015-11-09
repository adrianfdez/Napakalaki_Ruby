# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Dice
  include Singleton
  
  @@instance = Dice.new
  
  def initialize
    
  end
  
  def self.instance
    @@instance
  end
  
  def next_number
    rand(6)+1
  end
  
  private_class_method :new
end
