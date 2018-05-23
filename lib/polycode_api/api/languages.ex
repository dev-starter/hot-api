defmodule HotApi.API.Languages do
  use Maru.Router
  alias HotApi.Models.Languages
  alias Languages.Synataxes
  alias Languages.Characteristics
  alias Languages.Integrations
  alias Languages.Algorithms
  require Logger
  require IEx

  helpers HotApi.Helpers.Languages

  namespace :languages do
    desc "Retrieve list of the Languages"
    get do
      conn |> json(Languages.all)
    end

    route_param :language, type: String do
      desc "Retrieve a Languages collection data"
      get do
        conn |> json(Languages.find(params[:language]))
      end
    end

    namespace :syntaxes do
      desc "Retrieve list of the Synataxes by language"
      get :all do conn |> json(Synataxes.all) end

      route_param :language, type: String do
        desc "Retrieve the Synataxes by language"
        get do
          conn |> json(Synataxes.find(params[:language]))
        end
      end
    end

    namespace :characteristics do
      desc "Retrieve list of the Characteristics by language"
      get :all do conn |> json(Characteristics.all) end

      route_param :language, type: String do
        desc "Retrieve the Characteristics by language"
        get do
          conn |> json(Characteristics.find(params[:language]))
        end
      end
    end

    namespace :algorithms do
      desc "Retrieve list of the Algorithms by language"
      get :all do conn |> json(Algorithms.all) end

      route_param :language, type: String do
        desc "Retrieve the Algorithms by language"
        get do
          conn |> json(Algorithms.find(params[:language]))
        end
      end
    end

    namespace :integrations do
      desc "Retrieve list of the Integrations by language"
      get :all do conn |> json(Integrations.all) end

      route_param :language, type: String do
        desc "Retrieve the Integrations by language"
        get do
          conn |> json(Integrations.find(params[:language]))
        end
      end
    end
  end
end
