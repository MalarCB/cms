SitemapGenerator::Sitemap.default_host = 'http://coach.careerbuilder.com'
SitemapGenerator::Sitemap.create_index = :auto
SitemapGenerator::Interpreter.send :include, ReportHelper

SitemapGenerator::Sitemap.create(compress: false) do

  group(filename: :site, sitemaps_path: 'sitemaps/') do
    add root_path, priority: 1.0
    add browse_path, priority: 0.7
  end

  group(filename: :job_categories, sitemaps_path: 'sitemaps/') do
    JobTitle.where(is_cached: 't').group_by(&:job_category).each do |category, job_titles|
      add jobs_by_category_path(format_job_title(category)), lastmod: Time.now, priority: 0.7
    end
  end

  group(filename: :job_titles, sitemaps_path: 'sitemaps/') do
    JobTitle.find_each do |job_title|
      if job_title.is_cached
        add job_report_path(format_job_title(job_title.job_category), format_job_title(job_title.job_title)),
            lastmod: job_title.updated_at, priority: 0.7
      end
    end
  end

  group(filename: :home, sitemaps_path: 'sitemaps/') do
    JobTitle.find_each do |job_title|
      if job_title.is_cached
        add home_path(format_job_title(job_title.job_category), format_job_title(job_title.job_title)),
            lastmod: job_title.updated_at, priority: 0.7
      end
    end
  end

  group(filename: :salary, sitemaps_path: 'sitemaps/') do
    JobTitle.find_each do |job_title|
      if job_title.is_cached
        add salary_path(format_job_title(job_title.job_category), format_job_title(job_title.job_title)),
            lastmod: job_title.updated_at, priority: 0.7
      end
    end
  end

  group(filename: :skills, sitemaps_path: 'sitemaps/') do
    JobTitle.find_each do |job_title|
      if job_title.is_cached
        add skills_path(format_job_title(job_title.job_category), format_job_title(job_title.job_title)),
            lastmod: job_title.updated_at, priority: 0.7
      end
    end
  end

  group(filename: :demand, sitemaps_path: 'sitemaps/') do
    JobTitle.find_each do |job_title|
      if job_title.is_cached
        add demand_path(format_job_title(job_title.job_category), format_job_title(job_title.job_title)),
            lastmod: job_title.updated_at, priority: 0.7
      end
    end
  end
end
