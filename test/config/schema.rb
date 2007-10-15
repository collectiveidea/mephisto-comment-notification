ActiveRecord::Schema.define(:version => 1) do
  create_table "contents", :force => true do |t|
    t.column "article_id",     :integer
    t.column "user_id",        :integer
    t.column "title",          :string
    t.column "permalink",      :string
    t.column "excerpt",        :text
    t.column "body",           :text
    t.column "excerpt_html",   :text
    t.column "body_html",      :text
    t.column "created_at",     :datetime
    t.column "updated_at",     :datetime
    t.column "published_at",   :datetime
    t.column "type",           :string,   :limit => 20
    t.column "author",         :string,   :limit => 100
    t.column "author_url",     :string
    t.column "author_email",   :string
    t.column "author_ip",      :string,   :limit => 100
    t.column "comments_count", :integer,                 :default => 0
    t.column "version",        :integer
    t.column "updater_id",     :integer
    t.column "site_id",        :integer
    t.column "approved",       :boolean,                 :default => false
    t.column "comment_age",    :integer,                 :default => 0
    t.column "filter",         :string
  end
  
  create_table "sites", :force => true do |t|
    t.column "title",             :string
    t.column "subtitle",          :string
    t.column "email",             :string
    t.column "ping_urls",         :text
    t.column "articles_per_page", :integer,                :default => 15
    t.column "host",              :string
    t.column "akismet_key",       :string,  :limit => 100
    t.column "akismet_url",       :string
    t.column "approve_comments",  :boolean
    t.column "comment_age",       :integer
    t.column "timezone",          :string
    t.column "filter",            :string
  end
end