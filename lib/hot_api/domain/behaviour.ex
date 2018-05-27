defmodule HotApi.Domain.Behaviour do
  @callback all(state :: term) :: {:ok, new_state :: term} | {:error, reason :: term}
  @callback find(state :: term) :: {:ok, new_state :: term} | {:error, reason :: term}
end
