# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#encoding: utf-8

require 'singleton'

class Dice
  
  include singleton
  @@instance = Dice.new
  
  def self.instance
    @@instance
  end
  
  def next_number
    rand(6)+1
  end
  
  private_class_method :new
end
