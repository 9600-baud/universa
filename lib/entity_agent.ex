defmodule Universa.EntityAgent do
  @moduledoc """
  Stores information about entities
  """
  
  def start_link do
    Agent.start_link(fn -> %{} end)
  end

  # TODO
end
