defmodule Timesheetspa.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :desc, :string
    field :hours, :integer
    field :job_id, :id
    field :sheet_id, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:hours, :desc])
    |> validate_required([:hours, :desc])
  end
end
