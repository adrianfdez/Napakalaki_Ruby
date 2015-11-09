# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class Player
  
  MAXLEVEL = 10
  
  attr_writer :pending_bad_consequence, :enemy
  attr_reader :name, :read, :dead,
              :hidden_treasures, :visible_treasures,
              :level, :canl_steal
  
  def initialize(name)
    @name = name
  end
  
  private
  def bring_to_life
    @dead = true
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
    
  end
  
  def apply_bad_consequence(m)
    
  end
  
  def can_make_treasure_visible(t)
    
  end
  
  def how_many_visible_treasures(tKind)
    #revisar
  end
  
  def dielf_no_treasures
    if ((@hidden_treasures == nil) && (@visible_treasures == nil))
      @dead == true
    end
  end
  
  public
  def combat(m)
    
  end
  
  def make_treasures_visible(t)
    
  end
  
  def discard_visible_treasure(t)
    
  end
  
  def discard_hidden_treasure(t)
    
  end
  
  def valid_state
    valor = false
    if ((pending_bad_consequence.is_empty) && (hidden_treasure.size < 4))
      valor = true
    end
    valor
  end
  
  def init_treasure 
    
  end
  
  def steal_treasure 
    
  end
  
  def discard_all_treasures
    
  end
  
  private
  def give_me_a_treasure
    
  end
  
  def can_you_give_me_a_treasure
    var = false
    if ((hidden_treasure != nil) || (visible_treasure != nil))
      var = true
    end
    var
  end
  
  def have_stolen
    @canl_steal = false
  end
  
end
