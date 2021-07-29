defmodule MngoAppBuilderWeb.ContainersResolver do
  alias Container.Core

  def list(_root, _args, _info) do
    {:ok, Core.get_all()}
  end

  def show(_parent, args, _resolutions) do
    case Builder.Model.Container.find(args[:id]) do
      nil -> {:error, "Not found"}
      container -> {:ok, container}
    end
  end
end