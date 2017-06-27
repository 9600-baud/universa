defmodule Universa do
  @moduledoc """
  Documentation for Universa.
  """

  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Task.Supervisor, [[name: Universa.TaskSupervisor]]),
      supervisor(Universa.TerminalSupervisor, []),
      supervisor(Universa.EntitySupervisor,   []),
      worker(Task, [Universa.Server, :accept, [9001]]),
    ]

    Supervisor.start_link(children, [strategy: :one_for_one, name: Universa.Supervisor])
  end
end
