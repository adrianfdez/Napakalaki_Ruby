# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
#encoding: utf-8

monsters = Array.new

Prize price = Prize.new(2,1)
BadConsquence bad_consequence = BadConsequence.new_level_specific_treasures(
"Pierdes tu armadura visible y otra oculta", 
0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
monsters << Monster.new("3 Byakhees de bonanza", 8, bad_consequence, price)

price = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_specific_treasures(
"Embobados con el lindo primigenio te descartas de tu casco visible",
0, [TreasureKind::HELMET], 0)
monsters << Monster.new("Chibithulhu", 2, bad_consequence, price)

price = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_specific_treasures(
"El primordial bostezo contagioso. Pierdes el calzado visible", 
0, [TreasureKind::SHOES], 0)
monsters << Monster.new("El sopor de Dunwich", 2, bad_consequence, price)

price = Prize.new(4,1)
bad_consequence = BadConsequence.new_level_specific_treasures(
"Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.
Descarta 1 mano visible y 1 mano oculta",
0, [TreasureKind::ONE_HAND], [TreasureKind::ONE_HAND])
monsters << Monster.new("Ángeles de la noche ibicenca", 14, bad_consequence, price)

price = Prize.new(3,1)
bad_consequence = BadConsequence.new_level_number_of_treasures(
"Pierdes todos tus tesoros visibles", 
0, 10000, 0)
monsters << Monster.new("El gorrón en el umbral", 10, bad_consequence, price)

price = Prize.new(2,1)
bad_consequence = BadConsequence.new_level_specific_treasures(
"Pierdes la armadura visible",
0, [TreasureKind::ARMOR], 0)
monsters << Monster.new("H.P. Munchcraft", 6, bad_consequence, price)

price = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_specific_treasures(
"Sientes bichos bajo la ropa. Descarta la armadura visible",
0, [TreasureKind::ARMOR], 0)
monsters << Monster.new("Bichgooth", 2, bad_consequence, price)

price = Prize.new(4,2)
bad_consequence = BadConsequence.new_level_number_of_treasures(
"Pierdes 5 niveles y 3 tesoros visibles",
5, 3, 0)
monsters << Monster.new("El rey de rosa", 13, bad_consequence, price)

price = Prize.new(1,1)
bad_consequence = BadConsequence.new_level_number_of_treasures(
"Toses los pulmones y pierdes 2 niveles",
2, 0, 0)
monsters << Monster.new("La que redacta en las tinieblas", 2, bad_consequence, price)

def monstruos_fuertes
  array_monster = Array.new
  monsters.each do |monstruo|
    if monstruo.combat_level > 10
      array_monster << Monster.each
    end
  end
end


