defmodule MoipFlow.Models.Flow do
  alias MoipFlow.Services.Flow
  require IEx
  require Tentacat
  require System

  def get_pulls(client, branchs, repo) do
    pulls = Tentacat.Pulls.list("moip", "moip-flow", client)

    Enum.map(pulls, fn(pull) -> %{
      branch: pull["head"]["ref"],
      number: pull["number"],
      state: pull["state"]
    } end)
  end
end
