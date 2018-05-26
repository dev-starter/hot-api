defmodule HotApi.Repositories.Repository do
  alias HotApi.Repositories.Repository
  import Application
  require Mongo
  require Cachex
  require Logger

  def fast_find(query_key, projection \\ %{}) do
    cond do
      query_key == "all" ->
        search_query = %{}
        query_value = query_key
      true               ->
        search_query = query_key
        [query_value] = Map.values(query_key)
    end

    case Repository.find_from_cache(query_value, projection) do
      {:ok, result} ->
        Logger.info query_value <> " resource from Cache"

        result |> Enum.map &(&1 |> Map.delete("_id"))
      {:missing, projection, key} ->
        result = Repository.find(search_query, projection) |> Enum.map &(&1 |> Map.delete("_id"))
        Logger.info query_value <> " resource from Mongo - cached on " <> key

        Cachex.set(:cache, key, result)
        result
    end
  end

  def find(query, projection \\ %{}, collection \\ get_env(:mongodb, :collection_default)) do
    Mongo.find(
      :mongo,
      collection,
      query,
      limit: get_env(:mongodb, :pool),
      pool: DBConnection.Poolboy,
      projection: projection
    )
  end

  def find_from_cache(query_key, projection) do
    projectionList = Repository.atomize(projection)
    key = List.flatten([projectionList, query_key]) |> Enum.join("_")

    case Cachex.get(:cache, key) do
      {:ok, value} ->
        case value do
          nil -> {:missing, projection, key}
          _   -> {:ok, value}
        end

      {:error, error_message} -> {:missing, projection, key}
      {:missing, nil} -> {:missing, projection, key}
    end
  end

  def atomize(map) do
    for {key, val} <- map, into: [] do
      key
    end
  end
end
