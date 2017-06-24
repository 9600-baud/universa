defmodule Universa.EntityRegistry do
  @moduledoc """
  supervisor for entity data agents
  """
  
  use Supervisor

  def start_link do
    Supervisor.start_link(__MODULE__, :ok, name: Universa.EntityRegistry)
  end

  def init(:ok) do
    {:ok, [], {}}
  end
end
