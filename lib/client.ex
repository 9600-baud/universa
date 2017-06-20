defmodule Universa.Supervisor.Client do
  @moduledoc """
  Supervisor for client connection servers, consoles, etc.
  """
  use Supervisor
  
  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    children = [
      worker(Universa.Console, [])
    ]
    
    supervise(children, strategy: :one_for_one)
  end
end
