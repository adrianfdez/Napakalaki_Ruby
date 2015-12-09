# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#encoding: utf-8

require 'treasure_kind.rb'

class Treasure
  
  attr_reader :name, :bonus, :type
  
  def initialize(n, bonus, t)
    @name = n
    @bonus = bonus
    @type = t
  end
  
  def to_s
    " \n
      - Nombre: #{@name}
      - Bonus: #{@bonus}
      - Tipo de tesoro: #{@type} \n "
  end
  
end
