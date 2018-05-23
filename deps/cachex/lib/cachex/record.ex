defmodule Cachex.Record do
  @moduledoc false
  # Small module for defining record specs. We have a creation impementation in
  # this module to provide a central point for record creation, but little beyond
  # this functionality exists at this point.

  # define the opaque type
  @opaque t :: {
    key :: any,
    touched :: number,
    ttl :: number | nil,
    value :: any
  }

  @doc """
  Creates an input record based on a key, value and expiration.

  If the value passed is nil, then we apply any defaults. Otherwise we add the value
  to the current time (in milliseconds) and return a Tuple for the table.
  """
  def create(%Cachex.State{ } = state, key, value, expiration \\ nil) do
    { key, Cachex.Util.now(), expiration || state.default_ttl, value }
  end

end
