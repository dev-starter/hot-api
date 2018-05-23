defmodule Cachex.Actions.Purge do
  @moduledoc false
  # This module does nothing beyond provide an Action interface to the Janitor
  # purge system. We do nothing except delegate to the purge call in order to
  # allow the Janitor to do the heavy lifting at this point.

  # we need our imports
  use Cachex.Actions

  # add some aliases
  alias Cachex.Janitor
  alias Cachex.State

  @doc """
  Purges all expired records from the cache.

  This is a simple wrapper around the Janitor process, and simply calls the same
  eviction code manually. We do not need a Transaction here as that's handled
  internally by the Janitor process.

  There are currently no recognised options, the argument only exists for future
  proofing.
  """
  defaction purge(%State{ cache: cache } = state, options) do
    Janitor.purge_records(cache)
  end

end
