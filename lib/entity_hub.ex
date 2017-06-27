defmodule Universa.EntitySupervisor do
  @moduledoc """
  Watches entity agents, provides a gateway to 
  communicate with entities
  """

  use Supervisor
  @name Universa.EntitySupervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: @name)
  end
  
  def init(:ok) do
    children = [
      worker(Universa.EntityBucket, [], restart: :temporary)
    ]
    
    supervise(children, strategy: :simple_one_for_one)
  end

  def register_entity(type) do
    Supervisor.start_child(@name, [type])
  end
end
