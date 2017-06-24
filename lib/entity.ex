defmodule Universa.Entity do
  defstruct [
    uuid:         nil,
    name:         "Unknown",
    terminal:     nil,
    type:         nil,
    inventory:    [],
    living:       nil,
    active:       false,
  ]

  def new(type \\ :player) do
    uuid = UUID.uuid4()
    
    case type do
      :player -> 
	%Universa.Entity
	{
	  uuid:     uuid,
	  type:     :player,
	  terminal: Universa.Terminal.Login,
	  living:   true,
	}
	
      :npc    ->
	%Universa.Entity
	{
	  uuid:     uuid,
	  type:     :npc,
	  terminal: Universa.Terminal.NPC,
	  living:   true,
	}

      :item   ->
	%Universa.Entity
	{
	  uuid:     uuid,
	  type:     :item,
	  terminal: Universa.Terminal.Item,
	  living:   false,
	}
    end
  end
end
