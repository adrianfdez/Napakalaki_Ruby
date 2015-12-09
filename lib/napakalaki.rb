#encoding: utf-8


require 'card_dealer.rb'
require 'player.rb'
require 'monster.rb'


module Napakalaki
require Singleton

  class Napakalaki
  
  include singleton
  @@instance = Napakalaki.new
  
  attr_accessor  :current_monster , :current_player , :players , :dealer 
  
  private
  def initialize() end 
  
  def self.instance
    @@instance
  end
  
  private
  def init_players(names)
      @dealer= CardDealer.instance
      @players = Array.new
         
      names.each do |s|
 
        players << Player.new(s)
 
      end
       
  end
    
  private 
    def next_player
      total_players = @players.length 
 
        
        if (@current_player == nil) then
            next_index = rand(total_players)
            
        else
            current_player_index = @players.index(@current_player)
 
        if current_player_index == total_players then
            next_index = 0
            
        else
            next_index = current_player_index + 1
        end 
        
        end
        next_player = @players.at(next_index)
        @current_player = next_player
 
        return @current_player
    end
    
  private 
    def next_turn_allowed
      if @current_player == nil then
            allowed = true 
        else
            allowed = @current_player.valid_state 
        end
 
        return allowed
 
    end
      
  private 
     def set_enemies
      totalPlayers = @players.length
        @players.each do |p|
          index = random(totalPlayers)
          if p !=  @players.at(index) then 
          p.setEnemy(@players.at(index))
          
         else
           
          while p == @players.at(index)
          index = random(totalPlayers)
          p.setEnemy( @players.at(index))
              
          end
         end       
        end
     
     end
      
     def develop_combat
        combat = @current_player.combat(@current_monster)
        @dealer.give_monster_back(@current_monster)
        
        if combat==CombatResult::LOSEANDCONVERT then 
          
         cc = @dealer.next_cultist
         c_player = CulstistPlayer.new(@current_player,cc)
         @players.delete(@current_player)
         @players << c_player
         @current_player = c_player 
          
        end
       
       return combat 
     end
 
    
     def discard_visible_treasures(treasures)
       treasures.each do |t|
        @current_player.discard_visible_treasure(t) 
        @dealer.give_treasuresBack(t) 
       end
      end 
      
      def  discard_hidden_treasures(treasures)
        treasures.each do |t|
          @current_player.discard_hidden_treasure(t) 
          @dealer.give_treasuresBack(t) 
        end
      end 
      
      def make_treasures_visible(treasures) 
       treasures.each do |t| 
        @current_player.make_treasure_visible(t) 
       end
      end
      
      def init_game(players) 
        init_players(players) 
        dealer.init_cards 
        next_turn 
      end
   
      def get_current_player
        return @current_player ; 
      end
      
      def get_current_monster
        return @current_monster ; 
      end
      
      def next_turn
        state_ok = next_turn_allowed 
 
        if state_ok then
 
            @current_monster = @dealer.next_monster 
            @current_player = next_player 
            dead = @current_player.is_dead? 
 
            if dead then
             @current_player.init_treasures 
 
            end
        else
          @current_monster =  @dealer.next_monster
        end
 
        return state_ok 
      end
      
      def end_of_game(result)
        return result == CombatResult::WINGAME
      end
end

end