defmodule Timesheetspa.Jobs.Job do
  use Ecto.Schema
  import Ecto.Changeset

  schema "jobs" do
    field :desc, :string
    field :hours, :integer
    field :jobCode, :string
    field :name, :string
    belongs_to :user, Timesheetspa.Users.User
    has_many :tasks, Timesheetspa.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(job, attrs) do
    job
    |> cast(attrs, [:jobCode, :hours, :name, :desc])
    |> validate_required([:jobCode, :hours, :name, :desc])
  end
end
