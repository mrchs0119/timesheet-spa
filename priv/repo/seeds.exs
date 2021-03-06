# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Timesheetspa.Repo.insert!(%Timesheetspa.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Timesheetspa.Repo
alias Timesheetspa.Users.User

pw = Argon2.hash_pwd_salt("sunchihao123")

Repo.insert!(%User{name: "m1", email: "manager1@test.com", is_manager: true, password_hash: pw})
Repo.insert!(%User{name: "w1", email: "worker1@test.com", is_manager: false, manager_email: "manager1@test.com", password_hash: pw})
