defmodule Universa.Terminal.Login do
  @moduledoc """
  Login terminal for Universa
  """

  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, [], name: :terminal_login)
  end

  def inp(entity) do
    IO.puts(:hello_world)
  end

  def handle_cast({:inp, entity}) do
    self().in(entity)
  end
end
