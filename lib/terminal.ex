defmodule Universa.TerminalSupervisor do
  @moduledoc """
  Supervises terminals (e.g. login prompt, main menu, navigator)
  """

  use Supervisor
  
  def start_link do    
    Supervisor.start_link(__MODULE__, :ok, name: Universa.TerminalSupervisor)
  end

  def init(:ok) do
    
    # Terminals:
    terminals = [
      worker(Universa.Terminal.Login, [])
    ]

    supervise(terminals, strategy: :one_for_one)
  end
end
