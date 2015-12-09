#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'bad_consequence.rb'
require 'monster.rb'
require 'treasure.rb'
require 'treasure_kind.rb'
require 'combat_result.rb'

class Player
  
  @@MAXLEVEL = 10
  
  attr_writer :pending_bad_consequence, :enemy
  attr_reader :name, :read, :dead,
              :hidden_treasures, :visible_treasures,
              :level, :canl_steal
  
  def initialize(name)
    @name = name
    @dead = true
    @level = 1
    @visible_treasures = Array.new
    @hidden_treasures = Array.new
  end
  
  def self.MAXLEVEL 
    @@MAXLEVEL
  end
  
  private
  def bring_to_life
    @dead = false
  end
  
  def get_combat_level 
    combat_level = 0
    
    visible_treasure.each{ |t|
      combat_level += t.bonus
    }
    combat_level += @level
    
    combat_level
  end
  
  def incrementar_levels(l)
    @level += l
  end
   
  def decramentar_levels(l)
    @level -= l
  end
  
  def apply_prize(m)
    n_levels = m.get_levels_gained
    self.incrementar_levels(n_levels)
    n_treasures = m.get_treasures
    
    if n_treasures > 0
      dealer = CardDealer.instance
      for i in (1..n_treasures)
        treasure = dealer.nextTreasure
        @hidden_treasures << treasure
      end
    end
  end
  
  def apply_bad_consequence(m)
    bad_consequence = m.bc
    n_levels = bad_consequence.levels
    self.decrementar_levels(n_levels)
    pending_bad = bad_consequence.adjust_to_fit_treasure_lists(@visible_treasures, @hidden_treasures)
    self.pending_bad_consequence = pending_bad
  end
  
  def can_make_treasure_visible(t)
    es_posible = true
    tipo_tesoro = t.type
    t_kinds = Array.new
    
    #bucle para obtener un Array de los TreasureKind visibles
    @visible_treasures.each{ |tre|
      t_kinds << tre.type
    }
    
    #Comprobaciones
    if tipo_tesoro.equal?(TreasureKind::BOTH_HAND) and
        (t_kinds.include?(TreasureKind::BOTH_HAND) or
         t_kinds.include?(TreasureKind::ONE_HAND))
      then es_posible = false
    elsif tipo_tesoro.equal?(TreasureKind::ONE_HAND) and
         (t_kinds.include?(TreasureKind::BOTH_HAND) or
          t_kinds.count(TreasureKind::ONE_HAND))
      t_kinds.
      then es_posible = false
    elsif tipo_tesoro.equal?(TreasureKind::ARMOR) and
         t_kinds.include?(TreasureKind::ARMOR)
      then es_posible = false
    elsif tipo_tesoro.equal?(TreasureKind::HELMET) and
         t_kinds.include?(TreasureKind::HELMET)
      then es_posible = false
    elsif tipo_tesoro.equal?(TreasureKind::SHOES) and
         t_kinds.include?(TreasureKind::SHOES)
      then es_posible = false
    end
    
    es_posible
    
  end
  
  def how_many_visible_treasures(tKind)
    contador = 0
    @visible_treasures.each { |tesoro| 
      if tesoro.type == tKind
        then contador=contador+1
      end 
    }
    contador
  end
  
  def dielf_no_treasures
    if ((@hidden_treasures.empty?) && (@visible_treasures.empty?))
      then @dead == true
    end
  end
  
  public
  def combat(m)
    comb_res = nil
    my_level = self.get_combat_level
    monster_level = m.get_combat_level
    
    if my_level > monster_level
      apply_prize(m)
      if @level >= @@MAXLEVEL
        comb_res = CombatResult::WINGAME
      else @level < @@MAXLEVEL
        comb_res = CombatResult::WIN
      end
      
    else
      self.apply_bad_consequence(m)
      comb_res = CombatResult::LOSE
    end
    
    comb_res
  end
  
  def make_treasures_visible(t)
    canl = self.can_make_treasure_visible(t)
    if canl 
      @visible_treasures << t
      @hidden_treasures.delete(t)
    end
  end
  
  def discard_visible_treasure(t)
    @visible_treasures.delete(t)
    if @pending_bad_consequence != nil && !@pending_bad_consequence.is_empty? 
      then @pending_bad_consequence.substract_visible_treasure(t)
    end
  end
  
  def discard_hidden_treasure(t)
    @hidden_treasures.delete(t)
    if @pending_bad_consequence != nil && !@pending_bad_consequence.is_empty?
      @pending_bad_consequence.substract_hidden_treasure(t)
    end
  end
  
  def valid_state
    valor = false
    if ((@pending_bad_consequence.is_empty) and (@hidden_treasure.size < 4))
      valor = true
    end
    valor
  end
  
  def init_treasure 
    dealer = CardDealer.instance
    dice = Dice.instance
    
    self.bring_to_life
    treasure = dealer.nextTreasure
    self.hidden_treasures << treasure
    
    number = dice.next_number
    if number > 1
      treasure = dealer.nextTreasure
      self.hidden_treasures << treasure
    end
    if number == 6 
      treasure = dealer.nextTreasure
      self.hidden_treasures << treasure
    end
  end
  
  def steal_treasure 
    canl = self.canl_steal
    if canl
      treasure = @enemy.give_me_a_treasure
      self.hidden_treasures << treasure
      self.have_stolen
    end
    treasure
  end
  
  def discard_all_treasures
    visible = Array.new(@visible_treasures)
    hidden = Array.new(@hidden_treasures)
    
    visible.each { |treasure| 
      self.discard_visible_treasure(treasure)
    }
    hidden.each { |treasure| 
      self.discard_hidden_treasure(t)
    }
  end
  
  private
  def give_me_a_treasure
    n_aleatorio = @hidden_treasures.choice
    tesoro_aleatorio = @hidden_treaaures.at(n_aleatorio)
    @hidden_treasures.delete_at(n_aleatorio)
    
    tesoro_aleatorio
  end
  
  def can_you_give_me_a_treasure
    var = false
    if ((@hidden_treasure != nil) || (@visible_treasure != nil))
      var = true
    end
    var
  end
  
  def have_stolen
    @canl_steal = false
  end
  
  def to_s
    " \n
      - Nombre: #{@name}
      - Nivel: #{@level} \n "
  end
  
  
  
end
