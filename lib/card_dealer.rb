#encoding: utf-8

require 'singleton' 
require 'Treasure.rb'
require 'BadConsequence.rb'
require 'Monster.rb'
require 'Prize.rb'

module Napakalaki
require 'singleton'


class CardDealer
  
  include Singleton
  @@instance = CardDealer.new 
  
  attr_accessor :used_monsters , :unused_monsters , :used_treasures , :unused_treasures , :unused_cultists
  
  private
  def initialize() end 
  
  def self.instance
    @@instance = new 
  end
  
 
  private 
  def  init_treasure_card_deck
    
    @unused_treasures = Array.new
    
    @unused_treasures << Treasure.new("¡Si mi amo!",4, [TreasureKind::HELMET])
    @unused_treasures << Treasure.new("Botas de investigacion",3, [TreasureKind::SHOES])
    @unused_treasures << Treasure.new("Capucha de Cthulhu",3, [TreasureKind::HELMET])
    @unused_treasures << Treasure.new("A preba de babas",2, [TreasureKind::ARMOR])
    @unused_treasures << Treasure.new("Botas de lluvia acida ",1, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Casco minero",2, [TreasureKind::HELMET])
    @unused_treasures << Treasure.new("Ametralladora Thompson",4, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Camiseta de la UGR",1, [TreasureKind::ARMOR])
    @unused_treasures << Treasure.new("Clavo de rail ferroviario",3, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Cuchillo de sushi arcano",2, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Fez alopodo",3, [TreasureKind::HELMET])
    @unused_treasures << Treasure.new("Hacha prehistorica!",2, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("El aparato de Pr. Tesla",4, [TreasureKind::ARMOR])
    @unused_treasures << Treasure.new("Gaita",4, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Insecticida",2,[TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Escopeta de 3 canones",4, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Garabato mistico",2, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("La rebeca metalica",2, [TreasureKind::ARMOR])
    @unused_treasures << Treasure.new("Lanzallamas",4, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Necro-comicon",1, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Necrocomicon",5, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Linterna a 2 manos",3, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Necro-gnomicon",2, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Necrotelecom",2, [TreasureKind::HELMET])
    @unused_treasures << Treasure.new("Mazo de los antiguos",3, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Necro-playboycon",3, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Porra preternatural",2, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Shogulador",1, [TreasureKind::BOTH_HAND])
    @unused_treasures << Treasure.new("Varita de atizamiento",3, [TreasureKind::ONE_HAND])
    @unused_treasures << Treasure.new("Tentaculo de pega",2, [TreasureKind::HELMET])
    @unused_treasures << Treasure.new( "Zapato deja-amigos",1, [TreasureKind::SHOES])
    
    
  end
    
  private
  def init_monster_card_deck
    
    @unused_monsters = Array.new
    
    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Pierdes tu armadura visible y otra oculta', 
    0, [TreasureKind::ARMOR], [TreasureKind::ARMOR])
    price = Prize.new(2,1)
    @unused_monsters << Monster.new('3 Byakhees de bonanza', 8, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Embobados con el lindo primigenio te descartas de tu casco visible',
    0, [TreasureKind::HELMET], 0)
    price = Prize.new(1,1)
    @unused_monsters << Monster.new('Chibithulhu', 2, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'El primordial bostezo contagioso. Pierdes el calzado visible', 
    0, [TreasureKind::SHOES], 0)
    price = Prize.new(1,1)
    @unused_monsters << Monster.new('El sopor de Dunwich', 2, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo.
    Descarta 1 mano visible y 1 mano oculta',
    0, [TreasureKind::ONE_HAND], [TreasureKind::ONE_HAND])
    price = Prize.new(4,1)
    @unused_monsters << Monster.new('Angeles de la noche ibicenca', 14, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Pierdes todos tus tesoros visibles', 
    0, $MAXTREASURES, 0)
    price = Prize.new(3,1)
    @unused_monsters << Monster.new('El gorron en el umbral', 10, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Pierdes la armadura visible',
    0, [TreasureKind::ARMOR], 0)
    price = Prize.new(2,1)
    @unused_monsters << Monster.new('H.P. Munchcraft', 6, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Sientes bichos bajo la ropa. Descarta la armadura visible',
    0, [TreasureKind::ARMOR], 0)
    price = Prize.new(1,1)
    @unused_monsters << Monster.new('Bichgooth', 2, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Pierdes 5 niveles y 3 tesoros visibles',
    5, 3, 0)
    price = Prize.new(4,2)
    @unused_monsters << Monster.new('El rey de rosa', 13, bad_consequence, price)

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Toses los pulmones y pierdes 2 niveles',
    2, 0, 0)
    price = Prize.new(1,1)
    @unused_monsters << Monster.new('La que redacta en las tinieblas', 2, bad_consequence, price)

    bad_consequence = BadConsequence.new_death(
    'Estos monstruos resultan bastante superficiales y te aburren mortalmente.',
    true);
    price = Prize.new(2,1) 
    @unused_monsters <<  Monster.new('Los hondos', 8, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Pierdes 2 niveles y 2 tesoros ocultos.',
    2, 0, 2) ;
    price = Prize.new(2,1)
    @unused_monsters << Monster.new('Semillas Cthulhu', 4, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Te intentas escaquear.Pierdes una mano visible.',
    0, [TreasureKind::ONE_HAND], [] )
    price = Prize.new(2,1) 
    @unused_monsters <<  Monster.new('Dameargo', 1, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Da mucho asquito.Pierdes 3 niveles.',
    3, 0, 0) 
    price = Prize.new(1,1) 
    @unused_monsters << Monster.new('Pollipolipo volante', 3, bad_consequence, price) 

    bad_consequence = BadConsequence.new_death(
    'No le gusta que pronuncien mal su nombre.Estas muerto.',
    true) 
    price = Prize.new(3,1) 
    @unused_monsters << Monster.new('YskhtihyssgGoth', 12, bad_consequence, price) 

    bad_consequence = BadConsequence.new_death(
    'La familia te atrapa.Estas muerto.',
    true);
    price = Prize.new(4,1) 
    @unused_monsters << Monster.new('Familia feliz', 1, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'La quinta directiva primaria te obliga a perder 2 niveles y un tesoro 2 manos visible.',
    2, [TreasureKind::BOTH_HAND], []) 
    price = Prize.new(2,1) 
    @unused_monsters << Monster.new('Roboggoth', 8, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Te asusta en la noche.Pierdes un casco visible',
    0, [TreasureKind::HELMET], [])
    price = Prize.new(1,1) 
    @unused_monsters << Monster.new('El espia', 5, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Menudo susto te llevas.Pierdes 2 niveles y 5 tesoros visibles',
    2, 5, 0)
    price = Prize.new(1,1) 
    @unused_monsters << Monster.new('El Lenguas', 20, bad_consequence, price) 

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Te faltan manos para tanta cabeza.Pierdes 3 niveles y tus tesoros visibles de las manos',
    3, [TreasureKind::ONE_HAND, TreasureKind::ONE_HAND], [TreasureKind::BOTH_HAND]) 
    price = Prize.new(1,1)
    @unused_monsters << Monster.new('Bicefalo', 20, bad_consequence, price)  

    
    # Monstruos Sectarios

    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Pierdes 1 visible',
    0, [TreasureKind::ONEHAND], [])
    price = Prize.new(3,1) 
    @unused_monsters << Monster.new('El mal indecible inpronunciable', 10, bad_consequence, price,-2) 
    
    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Pierdes tus tesoros visibles.Jajaja',
    0, $MAXTREASURES, 0)
    price = Prize.new(2,1) 
    @unused_monsters << Monster.new('Testigos Oculares', 6, bad_consequence, price,2)
    
    bad_consequence = BadConsequence.new_death(
    'Hoy no es tu dia de suerte.Mueres.',
    true);
    price = Prize.new(2,5) 
    @unused_monsters << Monster.new('El gran cthulhu.',20, bad_consequence, price,4)
    
    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Tu gobierno te recorta 2 niveles.',
    2,0, 0)
    price = Prize.new(2,1) 
    @unused_monsters << Monster.new("Serpiente Politico", 8, bad_consequence, price,-2)
    
    bad_consequence = BadConsequence.new_level_specific_treasures(
    'Pierdes tu casco y tu armadura visible.Perdes tus manos ocultas',
    0, [TreasureKind::HELMET,TreasureKind::ARMOR], [TreasureKind::ONE_HAND,TreasureKind::ONE_HAND])
    price = Prize.new(1,1) 
    @unused_monsters << Monster.new('Felpuggoth', 2, bad_consequence, price,5)
    
    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Pierdes 2 niveles.',
    2,0, 0)
    price = Prize.new(4,2) 
    @unused_monsters << Monster.new("Shoggoth", 16, bad_consequence, price,-4) 

    bad_consequence = BadConsequence.new_level_number_of_treasures(
    'Pintalabios negro.Pierdes 2 niveles',
    2,0, 0)
    price = Prize.new(1,1) 
    @unused_monsters << Monster.new("Lolitagooth", 2, bad_consequence, price,3)
  end
  
  private
  def init_cultist_card_deck
    
     @unused_cultists = Array.new
    
     @unused_cultists << Cultist.new("Sectario 1",1)
     @unused_cultists << Cultist.new("Sectario 2",2)
     @unused_cultists << Cultist.new("Sectario 3",1)
     @unused_cultists << Cultist.new("Sectario 4",2)
     @unused_cultists << Cultist.new("Sectario 5",1)
     @unused_cultists << Cultist.new("Sectario 6",1)
     
  end

 private 
  def shuffle_monsters
    
   @unused_monsters.sort_by {random}
  end
  
  private
  def shuffle_treasures
    
    @unused_treasures.sort_by {random}
  end
  
  private
  def shuffle_cultists
    
    @unused_cultists.sort_by {random}
  end
  
  def next_treasure 
    if @unused_treasures.empty? then
       @used_treasures.each do |t|
       @unused_treasures<<t
         
      end
    
      puts shuffle_treasures
       @used_treasures.clear
       
    end
  
      t = @unused_treasures.at(0)
      @used_treasures<<t
      @unused_treasures.delete(t);
  
      return t
  end
  
  def next_monster
     if @unused_monsters.empty? then
       @used_monsters.each do |m|
       @unused_monsters << m
         
       end
    
      puts shuffle_monsters
       @used_monsters.clear
       
      end
  
      m = @unused_monsters.at(0)
      @used_monsters << m
      @unused_monsters.delete(m);
  
      return m
  end
  
  def next_cultist
      if @unused_cultists.empty? then 
        puts init_cultist_card_deck
        puts shuffle_cultists
      end
      
      m=@unused_cultists.at(0)
      @unused_cultists.delete(m)
  end
  
  def give_treasure_back(t)
    @used_treasures << Treasure.new(t)
  end
  
  def give_monster_back(m)
    @used_monsters << Monster.new(m)
  end
  
  def init_cards 
    puts init_treasure_card_deck 
    puts shuffle_treasures
        
    puts init_monster_card_deck  
    puts shuffle_monsters
    
    puts init_cultist_card_deck
    puts shuffle_cultists
  end

end

end