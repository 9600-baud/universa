defmodule Universa.Entity do
  @moduledoc """
  Agent and entity API
  """
  
  defstruct [
    uuid:         nil,
    name:         "Unknown",
    terminal:     nil,
    type:         nil,
    inventory:    [],
    living:       nil,
    active:       false,
    peer:         nil,
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

  ## Agent functions ##
  
  def peer(bucket, peer) do
    Agent.update(bucket, &Map.put(&1, :peer, peer))
  end
  
  def peer(bucket) do
    Agent.get(bucket, &Map.get(&1, :peer))
  end
end
