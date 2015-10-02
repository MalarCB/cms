SitemapGenerator::Sitemap.default_host = 'http://cablage-cms.com'
SitemapGenerator::Sitemap.create_index = :auto

SitemapGenerator::Sitemap.create(compress: false) do

  group(filename: :site, sitemaps_path: 'sitemaps/') do
    add root_path, priority: 1.0
    add services_path, priority: 0.7
    add gallery_path, priority: 0.7
  end
end
