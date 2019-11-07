defmodule TimesheetspaWeb.JobView do
  use TimesheetspaWeb, :view
  alias TimesheetspaWeb.JobView

  def render("index.json", %{jobs: jobs}) do
    %{data: render_many(jobs, JobView, "job.json")}
  end

  def render("show.json", %{job: job}) do
    %{data: render_one(job, JobView, "job.json")}
  end

  def render("job.json", %{job: job}) do
    %{id: job.id,
      jobCode: job.jobCode,
      hours: job.hours,
      name: job.name,
      desc: job.desc}
  end
end
