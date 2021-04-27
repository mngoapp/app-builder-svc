# Functional Core
# A Schema libary that is developed as a functional core.
# The functional core is library implementation.
# The functional core should work on data that’s validated and safe. It should be predictable, so it avoids side effects.
# A functional core is means to easily reason about the application core business logic that is the same pattern
# created by James Edward Gray and Bruce A. Tate found in the book "Designing Elixir Systems with OTP".
#
# Design
# The Schema uses
# - Ecto Adapter Repository pattern
# Usage
# Schema.Core.get_all
# Schema.Core.save("Page","PAGE","someschema","uischema")
# Schema.Core.update(1,"Page","PAGE","someschema","uischema")
# Schema.Core.delete_by_id(1)
# Schema.Core.get_by_id(1)
defmodule Schema.Core do
    import Ecto.Query, only: [from: 2]
    # Handle Put - Updates (or Inserts the value if it does not exist in the cache)
    def save(title, type, jsonschema, uischema) do
        {result, setting} = Builder.Repo.insert(%Builder.Model.Schema{title: title, type: type, jsonschema: jsonschema, uischema: uischema})
        result
    end

    def update(id, title, type) do
        setting = Builder.Repo.get!(Builder.Model.Schema, id)
        setting = Ecto.Changeset.change setting, title: title, type: type
        case Builder.Repo.update setting do
        {:ok, struct}       -> IO.puts "i updated " # Updated with success
        {:error, changeset} -> # Something went wrong
        end
    end

    def get_by_id(id) do
        Builder.Repo.get(Builder.Model.Schema,id)
    end


    def get_all() do
        Builder.Repo.all(Builder.Model.Schema)
    end

    def delete_all() do
        qiuery = from(s in Builder.Model.Schema, where: s.id > 0)
        Builder.Repo.delete_all(qiuery)
    end

    def delete_by_id(id) do
        setting = Builder.Repo.get!(Builder.Model.Schema,id)
        case Builder.Repo.delete setting do
        {:ok, struct}       -> :ok
        {:error, changeset} -> # Something went wrong
        end
    end
end
