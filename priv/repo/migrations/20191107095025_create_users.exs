defmodule Timesheetspa.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :name, :string
      add :manager_email, :string, default: nil, null: true
      add :is_manager, :boolean, default: false, null: false
      add :password_hash, :string, default: "", null: false
      timestamps()
    end

  end
end
