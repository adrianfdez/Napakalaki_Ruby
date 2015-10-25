# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Monster
  attr.accesor :name, :combat_level, :bc, :price
  
  def initialize(name, combat_level, bc, price)
    @name = name
    @combat_level = combat_level
    @bc = bc
    @price = price
  end
  
  def to_s
    "Nombre: #{@name} \n Nivel: #{@combat_level} \n 
     Buen rollo: #{@price} \n Mal rollo: #{@bc}"
  end
  
end
