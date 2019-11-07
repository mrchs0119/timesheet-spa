defmodule Timesheetspa.Sheets.Sheet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "sheets" do
    field :date, :date
    field :worker_id, :id

    timestamps()
  end

  @doc false
  def changeset(sheet, attrs) do
    sheet
    |> cast(attrs, [:date])
    |> validate_required([:date])
  end
end
