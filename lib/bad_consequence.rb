#encoding: utf-8

require 'treasure_kind.rb'
require 'treasure.rb'

class BadConsequence
  
  @@MAXTREASURES=10
  
  attr_accessor :text, :levels, :n_visible_treasures, :n_hidden_treasures, 
    :some_specific_visible_treasures, :some_specific_hidden_treasures, :death
  private_class_method :new
  
  def initialize(text, levels, some_visible_treasures, some_hidden_treasures,
  some_specific_visible_treasures, some_specific_hidden_treasures, death)
    @text = text
    @levels = levels
    @n_visible_treasures = some_visible_treasures
    @n_hidden_treasures = some_hidden_treasures
    @some_specific_visible_treasures = some_specific_visible_treasures
    @some_specific_hidden_treasures = some_specific_hidden_treasures
    @death = death
  end
  
  def self.new_level_number_of_treasures(text, some_levels, some_visible_treasures, some_hidden_treasures,
  some_specific_visible_treasures, some_specific_hidden_treasures, death)
    new(text, some_levels, some_visible_treasures, some_hidden_treasures,
    [], [], false)
  end
  
  def self.new_level_specific_treasures(text, some_levels, some_visible_treasures, some_hidden_treasures,
  some_specific_visible_treasures, some_specific_hidden_treasures, death)
    new(text, some_levels, 0, 0, 
    some_specific_visible_treasures, some_specific_hidden_treasures, false)
  end
  
  def self.new_death(text, some_levels, some_visible_treasures, some_hidden_treasures,
  some_specific_visible_treasures, some_specific_hidden_treasures, death)
    new(text, 0, 0, 0, [], [], death)
  end
    
  def self.MAXTREASURES
    @@MAXTREASURES
  end
  
  
    
  def to_s
    " \n
      - Descripción: #{@text}
      - Niveles: #{@levels}
      - Tesoros visibles: #{@n_visible_treasures}
      - Tesoros ocultos: #{@n_hidden_treasures}
      - Tesoros visibles específicos: #{@some_specific_visible_treasures}
      - Tesoros ocultos específicos: #{@some_specific_hidden_treasures}
      - Muerte: #{@death} \n "
  end
  
  def is_empty
    
    empty=false 
    if @n_hidden_treasures==0 and @n_visible_treasures==0 and 
        @some_specific_hidden_treasures.empty? and @some_specific_visible_treasures.empty?
      then empty=true
    end
    return empty
  end
  
  def substract_visible_treasure(t) 
    if(@n_visible_treasures > 0)
      then @n_visible_treasures -= 1 
    else
      @specific_visible_treasures.delete(t.type)
    end                       
  end
  
  def substract_hidden_treasure(t) 
    if(@n_hidden_treasures > 0)then
      @n_hidden_treasures -= 1 
    else
      @specific_hidden_treasures.delete(t.type)
    end                       
  end 
  
  
 
  def adjust_to_fit_treasure_lists(v,h) 
        
        #Creamos arrays y variables auxiliares
        
        bc = BadConsequence.new
        t_visible = Array.new
        t_hidden =  Array.new
        contador_v=0 
        contador_h=0 
        aux_v=0 
        aux_h=0
        
        #Recorremos los tesoros visibles
        
        v.each do |t|
            contador_v+= 1
        end
        #Recorremos los tesoros ocultos
        
        h.each do |t|
            contador_h+=1
        end
        
        #En el caso en que usamos tesoros normales (Constructor 1)
        if (@n_visible_treasures > 0||@n_hidden_treasures > 0) then
          
          if(@n_visible_treasures > contador_v) then
            aux_v = contador_v 
          
          else aux_v = @n_visible_treasures  #Devolvemos lo que el jugador tenia
          end 
                
          if(@n_hidden_treasures > contador_h) then
            aux_h = contador_h 
          
          else aux_h=@n_hidden_treasures 
          end 
                
          #Constructor 1
          bc = BadConsequence.new(@text,0,aux_v,aux_h) 
        
            
        #En el caso en que usamos tesoros especificos (Constructor #2)
        else
          v.each do |t| 
                    
            #Si contiene el TreasureKind lo agregamos
            if (@some_specific_visible_treasures.include?(t.type)) then
              t_visible << t.type
            end
          end
                
          h.each do |t| 
                    
            #Si contiene el TreasureKind lo agregamos
            if (@some_specific_hidden_treasures.include?(t.type)) then
              t_hidden << t.type
            end
          end
        
                
          #Constructor 2
          bc= BadConsequence.new(@text,0,t_visible,t_hidden)
        end
            
        return bc 
        
    end
    
  
end
