defmodule Universa.Console do
  @moduledoc """
  Console input process
  """
  use GenServer

  def start_link(:ok) do
    GenServer.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok}
  end

  def loop do
        # TODO: Continuously accept STDIN input and send it somewhere..
    IO.puts("This is a repeated test message")
    loop
  end

  def handle_cast({:loop}) do
    self().loop
  end
end
