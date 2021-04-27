# Functional Core
# A Container Core libary that is developed as a functional core.
# The functional core is library implementation.
# The functional core should work on data that’s validated and safe. It should be predictable, so it avoids side effects.
# A functional core is means to easily reason about the application core business logic that is the same pattern
# created by James Edward Gray and Bruce A. Tate found in the book "Designing Elixir Systems with OTP".
#
# Design
# The Container uses
# - Ecto Adapter Repository pattern
# Usage
# Container.Core.get_all
# Container.Core.save("My App","APP")
# Container.Core.delete_by_id("52cd171c-70db-43bf-9763-a6160bd7baf4")
# Container.Core.get_by_id("52cd171c-70db-43bf-9763-a6160bd7baf4")
defmodule Container.Core do
    import Ecto.Query, only: [from: 2]
    def save(title, type) do
        {result, container_item} = Builder.Repo.insert(%Builder.Model.Container{title: title, type: type})
        result
    end

    def update(id, title, type) do
        post = Builder.Repo.get!(Builder.Model.Item, id)
        post = Ecto.Changeset.change post, title: title, type: type
        case Builder.Repo.update post do
        {:ok, struct}       -> IO.puts "i updated " # Updated with success
        {:error, changeset} -> # Something went wrong
        end
    end

    def get_by_id(id) do
        Builder.Repo.get(Builder.Model.Container,id)
    end

    def get_all() do
        Builder.Repo.all(Builder.Model.Container)
    end

    def delete_by_id(id) do
        post = Builder.Repo.get!(Builder.Model.Container,id)
        case Builder.Repo.delete post do
        {:ok, struct}       -> :ok
        {:error, changeset} -> # Something went wrong
        end
    end
end
