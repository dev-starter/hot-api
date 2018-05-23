defmodule MoipFlow.API.Languages do
  use Maru.Router
  require Tentacat
  alias MoipFlow.Models.Flow
  require Logger
  require IEx
  require System

  helpers MoipFlow.Helpers.Flow

  namespace :releases do
    route_param :repo, type: String do
      params do
        requires :branchs, type: List
      end
      desc "Retrieve list of the Languages"
      post do
        client = Tentacat.Client.new(%{access_token: "c4e60ddb650394d6634f1d9c693290f84daed6fb"})

        branchs = Flow.get_pulls(client, params[:branchs], params[:repo])
        branchs

        conn |> json(branchs)
      end
    end
  end
end
