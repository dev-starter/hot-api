defmodule HotApi.API.User do
  use Maru.Router
  alias HotApi.Domain.User
  alias User.Documents
  require Logger
  require IEx

  helpers HotApi.Helpers.User

  namespace :users do
    desc "Retrieve list of the Languages"
    get do
      IEx.pry()
      conn |> json(User.all)
    end

    route_param :externalID, type: String do
      desc "Retrieve a Languages collection data"
      get do
        conn |> json(User.find(params[:externalID]))
      end

      desc "Retrieve list of the Algorithms by language"
      get :documents do
        conn |> json(Documents.find(params[:externalID]))
      end
    end
  end
end
