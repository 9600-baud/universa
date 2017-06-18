defmodule Universa do
  @moduledoc """
  Documentation for Universa.
  """

  use Application

  def start(_type, _args) do

    IO.puts("Hello, World!")
    Universa.Supervisor.Client.start_link
  end
end
