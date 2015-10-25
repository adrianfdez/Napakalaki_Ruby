# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

class BadConsequence
  attr.accesor :text, :levels, :n_visible_treasures, :n_hidden_treasures, 
    :someSpecificVisibleTreasures, :someSpecificHiddenTreasures, :death
  private_class_method :new
  
  def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures,
someSpecificVisibleTreasures, someSpecificHiddenTreasures, death)
    @text=aText
    @levels=someLevels
    @n_visible_treasures=someVisibleTreasures
    @n_hidden_treasures=someHiddenTreasures
    @someSpecificVisibleTreasures=someSpecificVisibleTreasures
    @someSpecificHiddenTreasures=someSpecificHiddenTreasures
    @death=death
  end
  
  def BadConsequence.new_level_number_of_treasures (aText, someLevels,
someVisibleTreasures, someHiddenTreasures)
    @text=aText
    @levels=someLevels
    @n_visible_treasures=someVisibleTreasures
    @n_hidden_treasures=someHiddenTreasures
  end

  def BadConsequence.new_level_specific_treasures (aText, someLevels,
someSpecificVisibleTreasures, someSpecificHiddenTreasures)
    @text=aText
    @levels=someLevels
    @someSpecificVisibleTreasures=someSpecificVisibleTreasures
    @someSpecificHiddenTreasures=someSpecificHiddenTreasures
  end

  def BadConsequence.new_death (aText, death)
    @text=aText
    @death=death
  end
  
  def to_s
    "Descripción: #{@text} \n Niveles: #{@levels} \n 
     Tesoros visibles: #{@n_visible_treasure} \n 
     Tesoros ocultos: #{@n_hidden_treasure} \n 
     Tesoros visibles específicos: #{@someSpecificVisibleTreasures} \n 
     Tesoros ocultos específicos: #{@someSpecificHiddenTreasures} \n
     Muerte: #{@death}"
  end
end
