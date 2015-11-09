
# encoding: utf-8

require "BadConsequence.rb"
require "Monster.rb"
require "Prize.rb"
require "treasure_kind.rb"

monsters = Array.new

bad_consequence = BadConsequence.new_level_specific_treasures(
'Pierdes tu armadura visible y otra oculta', 
0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
price = Prize.new(2,1)
monsters << Monster.new('3 Byakhees de bonanza', 8, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Embobados con el lindo primigenio te descartas de tu casco visible',
0, [TreasureKind::HELMET], 0)
price = Prize.new(1,1)
monsters << Monster.new('Chibithulhu', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'El primordial bostezo contagioso. Pierdes el calzado visible', 
0, [TreasureKind::SHOES], 0)
price = Prize.new(1,1)
monsters << Monster.new('El sopor de Dunwich', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.
Descarta 1 mano visible y 1 mano oculta',
0, [TreasureKind::ONE_HAND], [TreasureKind::ONE_HAND])
price = Prize.new(4,1)
monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, price)

bad_consequence = BadConsequence.new_level_number_of_treasures(
'Pierdes todos tus tesoros visibles', 
0, 10000, 0)
price = Prize.new(3,1)
monsters << Monster.new('El gorron en el umbral', 10, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Pierdes la armadura visible',
0, [TreasureKind::ARMOR], 0)
price = Prize.new(2,1)
monsters << Monster.new('H.P. Munchcraft', 6, bad_consequence, price)

bad_consequence = BadConsequence.new_level_specific_treasures(
'Sientes bichos bajo la ropa. Descarta la armadura visible',
0, [TreasureKind::ARMOR], 0)
price = Prize.new(1,1)
monsters << Monster.new('Bichgooth', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_level_number_of_treasures(
'Pierdes 5 niveles y 3 tesoros visibles',
5, 3, 0)
price = Prize.new(4,2)
monsters << Monster.new('El rey de rosa', 13, bad_consequence, price)

bad_consequence = BadConsequence.new_level_number_of_treasures(
'Toses los pulmones y pierdes 2 niveles',
2, 0, 0)
price = Prize.new(1,1)
monsters << Monster.new('La que redacta en las tinieblas', 2, bad_consequence, price)

bad_consequence = BadConsequence.new_death(
'Estos monstruos resultan bastante superficiales y te aburren mortalmente.',
true);
price = Prize.new(2,1) ;
monsters <<  Monster.new('Los hondos', 8, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_number_of_treasures(
'Pierdes 2 niveles y 2 tesoros ocultos.',
2, 0, 2) ;
price = Prize.new(2,1);
monsters << Monster.new('Semillas Cthulhu', 4, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'Te intentas escaquear.Pierdes una mano visible.',
0, [TreasureKind::ONE_HAND], [] );
price = Prize.new(2,1) ;
monsters <<  Monster.new('Dameargo', 1, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_number_of_treasures(
'Da mucho asquito.Pierdes 3 niveles.',
3, 0, 0) ;
price = Prize.new(1,1) ;
monsters << Monster.new('Pollipolipo volante', 3, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_death(
'No le gusta que pronuncien mal su nombre.Estas muerto.',
true) ;
price = Prize.new(3,1) ;
monsters << Monster.new('YskhtihyssgGoth', 12, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_death(
'La familia te atrapa.Estas muerto.',
true);
price = Prize.new(4,1) ;
monsters << Monster.new('Familia feliz', 1, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.',
2, [TreasureKind::BOTH_HAND], []) ;
price = Prize.new(2,1) ;
monsters << Monster.new('Roboggoth', 8, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'Te asusta en la noche.Pierdes un casco visible',
0, [TreasureKind::HELMET], []);
price = Prize.new(1,1) ;
monsters << Monster.new('El espia', 5, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_number_of_treasures(
'Menudo susto te llevas.Pierdes 2 niveles y 5 tesoros visibles',
2, 5, 0);
price = Prize.new(1,1) ;
monsters << Monster.new('El Lenguas', 20, bad_consequence, price) ;
    
bad_consequence = BadConsequence.new_level_specific_treasures(
'Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos',
3, [TreasureKind::ONE_HAND, TreasureKind::ONE_HAND], [TreasureKind::BOTH_HAND]) ;
price = Prize.new(1,1);
monsters << Monster.new('Bicefalo', 20, bad_consequence, price) ;      
    
    
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
    if perdida_niveles.bc.levels > 0
      then perdida_niveles << m
    end
  }
  puts perdida_niveles
  
end


def monstruos_buen_rollo(monsters)
  m_buenrollo = Array.new
  
  monsters.each{ |m| 
    if m_buenrollo.price.level > 1
      then m_buenrollo << m
    end
  }
  puts m_buenrollo
    
end


def monstruos_mal_rollo(monsters) 
  m_malrollo = Array.new 
    
  monsters.each{ |m|
    if (m_malrollo.bc.someVisibleTreasures)== 0  or (m_malrollo.bc.someSpecificVisibleTreasures).empty? == true
      if (m_malrollo.bc.some_hidden_reasures)== 0 or (m_malrollo.bc.someSpecificHiddenTreasures).empty? == true 
        then m_malrollo << m 
      end
    end 
  }
  puts m_malrollo

end
