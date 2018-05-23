defmodule Cachex.Actions.Update do
  @moduledoc false
  # This module handles the updating of values inside a cache. Updates do not
  # affect a currently set TTL, if you wish to have the TTL modified, simply set
  # a new value over the top.

  # we need our imports
  use Cachex.Actions

  # add some aliases
  alias Cachex.Actions
  alias Cachex.LockManager
  alias Cachex.State

  @doc """
  Updates a value inside the cache.

  Updates do not affect the touch time of a record, which is what makes an update
  call useful. If you need to update the touch time, immediately call the Touch
  action after an update.

  This action executes inside a Transaction to ensure that there are no keys currently
  under a lock - thus ensuring consistency.

  There are currently no recognised options, the argument only exists for future
  proofing.
  """
  defaction update(%State{ } = state, key, value, options) do
    LockManager.write(state, key, fn ->
      Actions.update(state, key, [{ 4, value }])
    end)
  end

end
