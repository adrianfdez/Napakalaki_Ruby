#encoding: utf-8

require 'bad_consequence.rb'
require 'prize.rb'
require 'monster.rb'
require 'treasure_kind.rb'

monsters = Array.new

bad_consequence = BadConsequence.new_level_specific_treasures(
'Pierdes tu armadura visible y otra oculta', 
0, 0, 0, [TreasureKind::ARMOR], [TreasureKind::ARMOR], false)
price = Prize.new(2,1)
monsters << Monster.new('3 Byakhees de bonanza', 8, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Embobados con el lindo primigenio te descartas de tu casco visible',
0, 0, 0, [TreasureKind::HELMET], [], false)
price = Prize.new(1,1)
monsters << Monster.new('Chibithulhu', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'El primordial bostezo contagioso. Pierdes el calzado visible', 
0, 0, 0, [TreasureKind::SHOES], [], false)
price = Prize.new(1,1)
monsters << Monster.new('El sopor de Dunwich', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.
Descarta 1 mano visible y 1 mano oculta',
0, 0, 0, [TreasureKind::ONE_HAND], [TreasureKind::ONE_HAND], false)
price = Prize.new(4,1)
monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, price)

bad_consequence = BadConsequence.new_level_number_of_treasures(
'Pierdes todos tus tesoros visibles', 
0, 0, 0, $MAXTREASURES, [], false)
price = Prize.new(3,1)
monsters << Monster.new('El gorron en el umbral', 10, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Pierdes la armadura visible',
0, 0, 0, [TreasureKind::ARMOR], [], false)
price = Prize.new(2,1)
monsters << Monster.new('H.P. Munchcraft', 6, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Sientes bichos bajo la ropa. Descarta la armadura visible',
0, 0, 0, [TreasureKind::ARMOR], [], false)
price = Prize.new(1,1)
monsters << Monster.new('Bichgooth', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_level_number_of_treasures(
'Pierdes 5 niveles y 3 tesoros visibles',
5, 3, 0, [], [], false)
price = Prize.new(4,2)
monsters << Monster.new('El rey de rosa', 13, bad_consequence, price)

bad_consequence = BadConsequence.new_level_number_of_treasures(
'Toses los pulmones y pierdes 2 niveles',
2, 0, 0, [], [], false)
price = Prize.new(1,1)
monsters << Monster.new('La que redacta en las tinieblas', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_death(
'Estos monstruos resultan bastante superficiales y te aburren mortalmente.',
0, 0, 0, [], [], true)
price = Prize.new(2,1) 
monsters <<  Monster.new('Los hondos', 8, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_number_of_treasures(
'Pierdes 2 niveles y 2 tesoros ocultos.',
2, 0, 2, [], [], false) 
price = Prize.new(2,1)
monsters << Monster.new('Semillas Cthulhu', 4, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'Te intentas escaquear.Pierdes una mano visible.',
0, 0, 0, [TreasureKind::ONE_HAND], [], false)
price = Prize.new(2,1) 
monsters <<  Monster.new('Dameargo', 1, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_number_of_treasures(
'Da mucho asquito.Pierdes 3 niveles.',
3, 0, 0, [], [], false) 
price = Prize.new(1,1) 
monsters << Monster.new('Pollipolipo volante', 3, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_death(
'No le gusta que pronuncien mal su nombre.Estas muerto.',
0, 0, 0, [], [], true) 
price = Prize.new(3,1) 
monsters << Monster.new('YskhtihyssgGoth', 12, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_death(
'La familia te atrapa.Estas muerto.',
0, 0, 0, [], [], true)
price = Prize.new(4,1)
monsters << Monster.new('Familia feliz', 1, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.',
2, 0, 0, [TreasureKind::BOTH_HAND], [], false) 
price = Prize.new(2,1) 
monsters << Monster.new('Roboggoth', 8, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'Te asusta en la noche.Pierdes un casco visible',
0, 0, 0, [TreasureKind::HELMET], [], false)
price = Prize.new(1,1) 
monsters << Monster.new('El espia', 5, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_number_of_treasures(
'Menudo susto te llevas.Pierdes 2 niveles y 5 tesoros visibles',
2, 5, 0, [], [], false)
price = Prize.new(1,1) 
monsters << Monster.new('El Lenguas', 20, bad_consequence, price) 
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos',
3, 0, 0, [TreasureKind::ONE_HAND, TreasureKind::ONE_HAND], [TreasureKind::BOTH_HAND], false) 
price = Prize.new(1,1)
monsters << Monster.new('Bicefalo', 20, bad_consequence, price)       
    
    
def monstruos_fuertes(monsters)           
  m_fuertes = Array.new 
    
  monsters.each{ |m| 
    if m.combat_level > 10
      then m_fuertes << m 
    end
  }
  puts m_fuertes 
    
end
   
def monstruos_perdida_niveles(monsters)
  perdida_niveles = Array.new
  
  monsters.each{ |m|
    if ((m.bc.levels != 0) and
        (m.bc.n_visible_treasures == 0) and 
        (m.bc.n_hidden_treasures == 0) and
        (m.bc.some_specific_visible_treasures.empty?) and 
        (m.bc.some_specific_hidden_treasures.empty?))
        then perdida_niveles << m
    end
  }
  puts perdida_niveles
  
end


def monstruos_buen_rollo(monsters)
  m_buenrollo = Array.new
  
  monsters.each{ |m| 
    if m.get_levels_gained > 1
      then m_buenrollo << m
    end
  }
  puts m_buenrollo
    
end


def monstruos_mal_rollo(monsters) 
  m_malrollo = Array.new 
    
  monsters.each{ |m|
    if (!(m.bc.some_specific_visible_treasures).empty? or
        !(m.bc.some_specific_hidden_treasures).empty?) 
        then m_malrollo << m 
    end
  }
  puts m_malrollo

end

puts "// Mostrar monstruos con nivel mayor de 10 //"
puts $\
puts monstruos_fuertes(monsters) 

puts "// Mostrar monstruos con solo perdida de niveles //"
puts $\
puts monstruos_perdida_niveles(monsters)

puts "// Mostrar monstruos con un buen rollo //"
puts $\
puts monstruos_buen_rollo(monsters)

puts "// Mostrar monstruos con un mal rollo //"
puts $\
puts monstruos_mal_rollo(monsters)