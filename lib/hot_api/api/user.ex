defmodule HotApi.API.User do
  use Maru.Router
  alias HotApi.Services.UserService
  require Logger

  helpers HotApi.Helpers.User

  namespace :users do
    desc "Retrieve list of the users"
    get do
      conn |> json(UserService.get_all)
    end

    route_param :externalID, type: String do
      desc "Retrieve a user collection data"
      get do
        conn |> json(UserService.find(params[:externalID]))
      end

      desc "Retrieve list of the documents by externalID"
      get :documents do
        conn |> json(UserService.find_documents(params[:externalID]))
      end
    end
  end
end
