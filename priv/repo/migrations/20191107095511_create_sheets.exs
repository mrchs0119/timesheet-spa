defmodule Timesheetspa.Repo.Migrations.CreateSheets do
  use Ecto.Migration

  def change do
    create table(:sheets) do
      add :date, :date
      add :worker_id, references(:users, on_delete: :nothing)
      add :status, :string, default: "pending", null: false

      timestamps()
    end

    create index(:sheets, [:worker_id])
  end
end
