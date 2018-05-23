defmodule Cachex.Actions.Set do
  @moduledoc false
  # This module contains the implementation of the set action. Internally we
  # convert the provided value and TTL to a record and insert it into the cache.
  # Naturally this happens inside a lock context to be sure there are no key
  # clashes.

  # we need our imports
  use Cachex.Actions

  # add some aliases
  alias Cachex.Actions
  alias Cachex.LockManager
  alias Cachex.Record
  alias Cachex.State
  alias Cachex.Util

  @doc """
  Sets a value inside the cache.

  Naturally this executes in a lock context to ensure that there are no other
  write operations currently happening on the key. We calculate the record to
  write outside of the lock context just to avoid potentially blocking the backing
  Transaction manager process for more time than is needed.
  """
  defaction set(%State{ } = state, key, value, options) do
    ttlval = Util.get_opt(options, :ttl, &is_integer/1)
    record = Record.create(state, key, value, ttlval)

    LockManager.write(state, key, fn ->
      Actions.write(state, record)
    end)
  end

end
