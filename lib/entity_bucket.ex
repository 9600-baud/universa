defmodule Universa.EntityBucket do
  @moduledoc """
  Provides data storage for entities
  """

  def start_link(type) do
    Agent.start_link(fn -> Universa.Entity.new type end)
  end

  def peer(state, peer) do
    Agent.update(state, &Map.put(&1, :peer, peer))
  end
  
  def peer(state) do
    Agent.get(state, &Map.get(&1, :peer))
  end  
end
