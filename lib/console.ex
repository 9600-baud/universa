defmodule Universa.Console do
  @moduledoc """
  Console input process
  """
  use GenServer

  def start_link do
    GenServer.start_link(__MODULE__, :ok, [name: :console])
  end

  def init(:ok) do
    {:ok, []}
  end

  def loop do
    msg = IO.gets("")
    IO.puts(msg)
    # IO.puts("This is a repeated test message")
    loop()
  end
end
