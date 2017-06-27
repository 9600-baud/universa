defmodule Universa.Server do
  @moduledoc """
  Provides a simple TCP server for MUD clients
  The majority of this code can be found at:
  https://elixir-lang.org/getting-started/mix-otp/task-and-gen-tcp.html
  I do not accept any credit for it.
  """
  
  require Logger

  def accept(port) do
    # The options below mean:
    #
    # 1. `:binary` - receives data as binaries (instead of lists)
    # 2. `packet: :line` - receives data line by line
    # 3. `active: false` - blocks on `:gen_tcp.recv/2` until data is available
    # 4. `reuseaddr: true` - allows us to reuse the address if the listener crashes
    #
    {:ok, socket} = :gen_tcp.listen(port,
      [:binary, packet: :line, active: false, reuseaddr: true])
    Logger.info "Accepting connections on port #{port}"
    loop_acceptor(socket)
  end

  defp loop_acceptor(socket) do
    {:ok, client} = :gen_tcp.accept(socket)

    # Create an entity and stamp a peer addr,port pair to it:
    {:ok, entity} = Universa.EntitySupervisor.register_entity :player
    Universa.EntityBucket.peer(:inet.peername(client))
    
  {:ok, pid} = Task.Supervisor.start_child(Universa.TaskSupervisor, fn -> serve(client) end)
    loop_acceptor(socket)
  end

  defp serve(client) do
    line = client |> read_line()
    IO.puts("Got line: #{line}")
    serve(client)
  end

  defp read_line(socket) do
    {:ok, data} = :gen_tcp.recv(socket, 0)
    data
  end

  defp write_line(line, socket) do
    :gen_tcp.send(socket, line)
  end
end
