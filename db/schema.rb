# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20181128145403) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "additional_contents", force: :cascade do |t|
    t.string   "area"
    t.string   "title"
    t.text     "content"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "additional_contents", ["area"], name: "index_additional_contents_on_area", using: :btree

  create_table "additional_home_contents", force: :cascade do |t|
    t.string   "title",                       null: false
    t.string   "content_type",                null: false
    t.integer  "video_id"
    t.text     "content"
    t.integer  "position",     default: 0,    null: false
    t.boolean  "display",      default: true, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "additional_home_contents", ["video_id"], name: "index_additional_home_contents_on_video_id", using: :btree

  create_table "articles", force: :cascade do |t|
    t.string   "title",                                    null: false
    t.text     "summary",                                  null: false
    t.text     "content",                                  null: false
    t.string   "image"
    t.date     "date",                                     null: false
    t.boolean  "display",                  default: true,  null: false
    t.boolean  "home_highlight",           default: true,  null: false
    t.integer  "author_id"
    t.string   "slug"
    t.string   "url_originally_posted_on"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.boolean  "display_on_client_zone",   default: false
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", unique: true, using: :btree

  create_table "articles_guides", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "guide_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "articles_guides", ["article_id"], name: "index_articles_guides_on_article_id", using: :btree
  add_index "articles_guides", ["guide_id"], name: "index_articles_guides_on_guide_id", using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "title",                             null: false
    t.string   "image",                             null: false
    t.integer  "position",    default: 0,           null: false
    t.boolean  "display",     default: true,        null: false
    t.text     "summary"
    t.string   "link"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "button_text", default: "Read more"
  end

  create_table "body_part_sections", force: :cascade do |t|
    t.integer  "body_part_id"
    t.string   "title",                       null: false
    t.string   "sub_title"
    t.text     "content",                     null: false
    t.string   "image"
    t.integer  "position",     default: 0,    null: false
    t.boolean  "display",      default: true, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "body_part_sections", ["body_part_id"], name: "index_body_part_sections_on_body_part_id", using: :btree

  create_table "body_parts", force: :cascade do |t|
    t.string   "tagline"
    t.integer  "position",                 default: 0,    null: false
    t.boolean  "display",                  default: true, null: false
    t.string   "slug"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.text     "summary"
    t.integer  "body_part_sections_count", default: 0,    null: false
    t.integer  "category_id"
  end

  add_index "body_parts", ["category_id"], name: "index_body_parts_on_category_id", unique: true, using: :btree
  add_index "body_parts", ["slug"], name: "index_body_parts_on_slug", unique: true, using: :btree

  create_table "case_studies", force: :cascade do |t|
    t.string   "title",                         null: false
    t.string   "image"
    t.text     "summary",                       null: false
    t.text     "content",                       null: false
    t.date     "date",                          null: false
    t.integer  "client_id"
    t.boolean  "display",        default: true, null: false
    t.boolean  "home_highlight", default: true, null: false
    t.string   "slug"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "case_studies", ["client_id"], name: "index_case_studies_on_client_id", using: :btree
  add_index "case_studies", ["slug"], name: "index_case_studies_on_slug", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",                       null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.boolean  "standalone", default: false
    t.string   "image"
    t.string   "content"
    t.string   "tagline"
  end

  add_index "categories", ["name"], name: "index_categories_on_name", unique: true, using: :btree

  create_table "categories_articles", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "article_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories_articles", ["article_id"], name: "index_categories_articles_on_article_id", using: :btree
  add_index "categories_articles", ["category_id"], name: "index_categories_articles_on_category_id", using: :btree

  create_table "categories_case_studies", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "case_study_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "categories_case_studies", ["case_study_id"], name: "index_categories_case_studies_on_case_study_id", using: :btree
  add_index "categories_case_studies", ["category_id"], name: "index_categories_case_studies_on_category_id", using: :btree

  create_table "categories_frequently_asked_questions", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "frequently_asked_question_id"
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.integer  "position",                     default: 0, null: false
  end

  add_index "categories_frequently_asked_questions", ["category_id"], name: "categories_faqs_category", using: :btree
  add_index "categories_frequently_asked_questions", ["frequently_asked_question_id"], name: "categories_faqs_faq", using: :btree

  create_table "categories_guides", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "guide_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position",    default: 0, null: false
  end

  add_index "categories_guides", ["category_id"], name: "index_categories_guides_on_category_id", using: :btree
  add_index "categories_guides", ["guide_id"], name: "index_categories_guides_on_guide_id", using: :btree

  create_table "categories_testimonials", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "position",       default: 0, null: false
  end

  add_index "categories_testimonials", ["category_id"], name: "index_categories_testimonials_on_category_id", using: :btree
  add_index "categories_testimonials", ["testimonial_id"], name: "index_categories_testimonials_on_testimonial_id", using: :btree

  create_table "categories_videos", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "video_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.integer  "position",    default: 0, null: false
  end

  add_index "categories_videos", ["category_id"], name: "index_categories_videos_on_category_id", using: :btree
  add_index "categories_videos", ["video_id"], name: "index_categories_videos_on_video_id", using: :btree

  create_table "client_zone_additional_contents", force: :cascade do |t|
    t.string   "area",                      null: false
    t.string   "title"
    t.text     "content"
    t.boolean  "display",    default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "client_zone_services", force: :cascade do |t|
    t.string   "title",                     null: false
    t.text     "summary",                   null: false
    t.string   "file",                      null: false
    t.string   "image"
    t.boolean  "display",    default: true
    t.integer  "position"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "client_zone_users", force: :cascade do |t|
    t.string   "username",                       null: false
    t.string   "password_digest",                null: false
    t.string   "auth_token",                     null: false
    t.boolean  "active",          default: true
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "logo",                      null: false
    t.string   "slug"
    t.integer  "position",   default: 0,    null: false
    t.boolean  "display",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "clients", ["slug"], name: "index_clients_on_slug", unique: true, using: :btree

  create_table "frequently_asked_questions", force: :cascade do |t|
    t.string   "question",                  null: false
    t.text     "answer",                    null: false
    t.boolean  "display",    default: true, null: false
    t.integer  "position",   default: 0,    null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
  end

  add_index "friendly_id_slugs", ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
  add_index "friendly_id_slugs", ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
  add_index "friendly_id_slugs", ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
  add_index "friendly_id_slugs", ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree

  create_table "guide_downloads", force: :cascade do |t|
    t.integer  "guide_id"
    t.string   "name"
    t.string   "job_title"
    t.string   "email"
    t.string   "phone"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "utm_source"
    t.string   "utm_campaign"
    t.string   "utm_medium"
    t.string   "utm_term"
  end

  add_index "guide_downloads", ["guide_id"], name: "index_guide_downloads_on_guide_id", using: :btree

  create_table "guides", force: :cascade do |t|
    t.string   "title",                            null: false
    t.text     "content"
    t.string   "image"
    t.string   "file",                             null: false
    t.boolean  "display",          default: true,  null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "video_id"
    t.boolean  "gated",            default: false
    t.boolean  "optionally_gated"
  end

  add_index "guides", ["video_id"], name: "index_guides_on_video_id", unique: true, using: :btree

  create_table "health_zones", force: :cascade do |t|
    t.string   "title",                     null: false
    t.string   "image"
    t.string   "home_image",                null: false
    t.string   "hover_text",                null: false
    t.string   "link",                      null: false
    t.integer  "position",   default: 0,    null: false
    t.boolean  "display",    default: true, null: false
    t.text     "content"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "health_zones", ["link"], name: "index_health_zones_on_link", unique: true, using: :btree
  add_index "health_zones", ["title"], name: "index_health_zones_on_title", unique: true, using: :btree

  create_table "job_applications", force: :cascade do |t|
    t.integer  "job_listing_id"
    t.string   "name",           null: false
    t.string   "telephone"
    t.string   "email",          null: false
    t.string   "cv",             null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "job_applications", ["job_listing_id"], name: "index_job_applications_on_job_listing_id", using: :btree

  create_table "job_listings", force: :cascade do |t|
    t.string   "title",                                 null: false
    t.text     "summary"
    t.text     "description",                           null: false
    t.date     "display_from",                          null: false
    t.date     "display_until",                         null: false
    t.boolean  "display",                default: true, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "job_applications_count", default: 0
  end

  create_table "landing_pages", force: :cascade do |t|
    t.string   "title",                         null: false
    t.text     "content"
    t.string   "image"
    t.string   "style",                         null: false
    t.string   "layout",                        null: false
    t.boolean  "display",        default: true, null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.integer  "sections_count", default: 0,    null: false
  end

  add_index "landing_pages", ["slug"], name: "index_landing_pages_on_slug", using: :btree
  add_index "landing_pages", ["suggested_url"], name: "index_landing_pages_on_suggested_url", using: :btree

  create_table "landing_pages_articles", force: :cascade do |t|
    t.integer  "article_id"
    t.integer  "landing_page_id"
    t.boolean  "display",         default: true, null: false
    t.integer  "position",        default: 0,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "landing_pages_articles", ["article_id"], name: "index_landing_pages_articles_on_article_id", using: :btree
  add_index "landing_pages_articles", ["landing_page_id"], name: "index_landing_pages_articles_on_landing_page_id", using: :btree

  create_table "landing_pages_case_studies", force: :cascade do |t|
    t.integer  "case_study_id"
    t.integer  "landing_page_id"
    t.boolean  "display",         default: true, null: false
    t.integer  "position",        default: 0,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "landing_pages_case_studies", ["case_study_id"], name: "index_landing_pages_case_studies_on_case_study_id", using: :btree
  add_index "landing_pages_case_studies", ["landing_page_id"], name: "index_landing_pages_case_studies_on_landing_page_id", using: :btree

  create_table "landing_pages_frequently_asked_questions", force: :cascade do |t|
    t.integer  "frequently_asked_question_id"
    t.integer  "landing_page_id"
    t.boolean  "display",                      default: true, null: false
    t.integer  "position",                     default: 0,    null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "landing_pages_frequently_asked_questions", ["frequently_asked_question_id"], name: "index_landing_pages_faqs_on_landing_page_id", using: :btree
  add_index "landing_pages_frequently_asked_questions", ["landing_page_id"], name: "index_landing_pages_landing_page_on_landing_page_id", using: :btree

  create_table "landing_pages_guides", force: :cascade do |t|
    t.integer  "guide_id"
    t.integer  "landing_page_id"
    t.boolean  "display",         default: true, null: false
    t.integer  "position",        default: 0,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "landing_pages_guides", ["guide_id"], name: "index_landing_pages_guides_on_guide_id", using: :btree
  add_index "landing_pages_guides", ["landing_page_id"], name: "index_landing_pages_guides_on_landing_page_id", using: :btree

  create_table "landing_pages_sections", force: :cascade do |t|
    t.integer  "landing_page_id"
    t.string   "title",                             null: false
    t.string   "sub_title"
    t.text     "content"
    t.string   "image"
    t.integer  "position",        default: 0,       null: false
    t.boolean  "display",         default: true,    null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "style",           default: "basic", null: false
  end

  add_index "landing_pages_sections", ["landing_page_id"], name: "index_landing_pages_sections_on_landing_page_id", using: :btree

  create_table "landing_pages_service_standards", force: :cascade do |t|
    t.integer  "service_standard_id"
    t.integer  "landing_page_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "landing_pages_service_standards", ["landing_page_id"], name: "index_landing_pages_service_standards_on_landing_page_id", using: :btree
  add_index "landing_pages_service_standards", ["service_standard_id"], name: "index_landing_pages_service_standards_on_service_standard_id", using: :btree

  create_table "landing_pages_testimonials", force: :cascade do |t|
    t.integer  "testimonial_id"
    t.integer  "landing_page_id"
    t.boolean  "display",         default: true, null: false
    t.integer  "position",        default: 0,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "landing_pages_testimonials", ["landing_page_id"], name: "index_landing_pages_testimonials_on_landing_page_id", using: :btree
  add_index "landing_pages_testimonials", ["testimonial_id"], name: "index_landing_pages_testimonials_on_testimonial_id", using: :btree

  create_table "landing_pages_videos", force: :cascade do |t|
    t.integer  "video_id"
    t.integer  "landing_page_id"
    t.boolean  "display",         default: true, null: false
    t.integer  "position",        default: 0,    null: false
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "landing_pages_videos", ["landing_page_id"], name: "index_landing_pages_videos_on_landing_page_id", using: :btree
  add_index "landing_pages_videos", ["video_id"], name: "index_landing_pages_videos_on_video_id", using: :btree

  create_table "mailchimp_emails", force: :cascade do |t|
    t.integer  "mailchimp_subscriber_id"
    t.string   "title"
    t.integer  "opens"
    t.datetime "last_open"
    t.integer  "clicks"
    t.datetime "last_click"
    t.integer  "sends"
    t.datetime "last_sent"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "campaign_id"
  end

  add_index "mailchimp_emails", ["mailchimp_subscriber_id"], name: "index_mailchimp_emails_on_mailchimp_subscriber_id", using: :btree

  create_table "mailchimp_processors", force: :cascade do |t|
    t.boolean  "in_progress"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "mailchimp_subscribers", force: :cascade do |t|
    t.string   "email_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "email_address"
    t.string   "email_type"
    t.string   "fname"
    t.string   "lname"
    t.string   "mmerge3"
    t.string   "mmerge4"
    t.decimal  "avg_open_rate"
    t.decimal  "avg_click_rate"
    t.datetime "timestamp_opt"
    t.string   "email_client"
    t.float    "latitude"
    t.float    "longitude"
  end

  create_table "optimadmin_administrators", force: :cascade do |t|
    t.string   "username",               null: false
    t.string   "email",                  null: false
    t.string   "role",                   null: false
    t.string   "auth_token"
    t.string   "password_digest",        null: false
    t.string   "password_reset_token"
    t.datetime "password_reset_sent_at"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.datetime "password_changed_at"
  end

  add_index "optimadmin_administrators", ["auth_token"], name: "index_optimadmin_administrators_on_auth_token", using: :btree
  add_index "optimadmin_administrators", ["email"], name: "index_optimadmin_administrators_on_email", using: :btree
  add_index "optimadmin_administrators", ["username"], name: "index_optimadmin_administrators_on_username", using: :btree

  create_table "optimadmin_documents", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "document",    null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_external_links", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_images", force: :cascade do |t|
    t.string   "name",        null: false
    t.string   "image",       null: false
    t.string   "module_name"
    t.integer  "module_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "optimadmin_links", force: :cascade do |t|
    t.string   "menu_resource_type"
    t.integer  "menu_resource_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  create_table "optimadmin_menu_item_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "optimadmin_menu_item_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "menu_item_anc_desc_idx", unique: true, using: :btree
  add_index "optimadmin_menu_item_hierarchies", ["descendant_id"], name: "menu_item_desc_idx", using: :btree

  create_table "optimadmin_menu_items", force: :cascade do |t|
    t.string   "menu_name",       limit: 100
    t.string   "name",            limit: 100
    t.integer  "parent_id"
    t.boolean  "deletable",                   default: true
    t.boolean  "new_window",                  default: false
    t.string   "title_attribute", limit: 100
    t.integer  "position",                    default: 0
    t.integer  "link_id"
    t.boolean  "display",                     default: true,  null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "optimadmin_menu_items", ["link_id"], name: "index_optimadmin_menu_items_on_link_id", using: :btree

  create_table "optimadmin_module_pages", force: :cascade do |t|
    t.string   "name"
    t.string   "route"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "optimadmin_site_settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.string   "environment"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                                null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.string   "image"
    t.string   "style",                                null: false
    t.string   "layout",                               null: false
    t.boolean  "display",              default: true
    t.text     "content",                              null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.boolean  "display_case_studies", default: false
    t.boolean  "display_news",         default: false
  end

  create_table "pages_team_members", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "team_member_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pages_team_members", ["page_id"], name: "index_pages_team_members_on_page_id", using: :btree
  add_index "pages_team_members", ["team_member_id"], name: "index_pages_team_members_on_team_member_id", using: :btree

  create_table "pages_testimonials", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pages_testimonials", ["page_id"], name: "index_pages_testimonials_on_page_id", using: :btree
  add_index "pages_testimonials", ["testimonial_id"], name: "index_pages_testimonials_on_testimonial_id", using: :btree

  create_table "partners", force: :cascade do |t|
    t.integer  "position"
    t.string   "title"
    t.text     "summary"
    t.text     "content"
    t.string   "image"
    t.string   "website_url"
    t.boolean  "display",     default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "people_helped_sections", force: :cascade do |t|
    t.string   "title",                      null: false
    t.integer  "number",                     null: false
    t.text     "content"
    t.string   "link"
    t.boolean  "display",     default: true, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "category_id"
  end

  add_index "people_helped_sections", ["category_id"], name: "index_people_helped_sections_on_category_id", unique: true, using: :btree

  create_table "pg_search_documents", force: :cascade do |t|
    t.text     "content"
    t.integer  "searchable_id"
    t.string   "searchable_type"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "pg_search_documents", ["searchable_type", "searchable_id"], name: "index_pg_search_documents_on_searchable_type_and_searchable_id", using: :btree

  create_table "policies_categories", force: :cascade do |t|
    t.integer  "position",        default: 0,    null: false
    t.string   "title",                          null: false
    t.integer  "documents_count", default: 0
    t.boolean  "display",         default: true
    t.string   "suggested_url"
    t.string   "slug"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
  end

  add_index "policies_categories", ["slug"], name: "index_policies_categories_on_slug", using: :btree

  create_table "policies_documents", force: :cascade do |t|
    t.integer  "policies_category_id"
    t.integer  "position",             default: 0,    null: false
    t.string   "title",                               null: false
    t.text     "summary"
    t.string   "file"
    t.boolean  "display",              default: true
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "policies_documents", ["policies_category_id"], name: "index_policies_documents_on_policies_category_id", using: :btree

  create_table "practice_applications_contacts", force: :cascade do |t|
    t.integer  "practice_id"
    t.string   "name",        null: false
    t.string   "position",    null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "practice_applications_contacts", ["practice_id"], name: "index_practice_applications_contacts_on_practice_id", using: :btree

  create_table "practice_applications_practices", force: :cascade do |t|
    t.string   "name",                                          null: false
    t.text     "address",                                       null: false
    t.string   "county"
    t.string   "postcode",                                      null: false
    t.string   "telephone",                                     null: false
    t.string   "fax"
    t.string   "email",                                         null: false
    t.boolean  "public_liability_insurance",     default: true, null: false
    t.boolean  "employee_liability_insurance",   default: true, null: false
    t.string   "monday"
    t.string   "tuesday"
    t.string   "wednesday"
    t.string   "thursday"
    t.string   "friday"
    t.string   "capacity"
    t.boolean  "receptionist",                                  null: false
    t.boolean  "parking_facilities",                            null: false
    t.string   "established"
    t.text     "cancellation_policy"
    t.text     "description"
    t.string   "treatment_rooms"
    t.string   "initial_assessment_cost"
    t.string   "subsequent_treatment_cost"
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.string   "initial_assessment_duration"
    t.string   "subsequent_treatment_duration"
    t.string   "manual_therapy"
    t.string   "tm2_or_pps"
    t.boolean  "online_booking"
    t.string   "saturday"
    t.string   "sunday"
    t.boolean  "disabled_access"
    t.boolean  "bupa_registered"
    t.boolean  "domiciliary_visits"
    t.date     "public_liability_expiry_date"
    t.date     "employee_liability_expiry_date"
    t.string   "document"
  end

  create_table "practice_applications_practitioners", force: :cascade do |t|
    t.integer  "practice_id"
    t.string   "name"
    t.date     "qualification_date"
    t.string   "years_practicing"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "practice_applications_practitioners", ["practice_id"], name: "index_practice_applications_practitioners_on_practice_id", using: :btree

  create_table "practices", force: :cascade do |t|
    t.string   "name",                      null: false
    t.string   "address"
    t.string   "town"
    t.string   "county"
    t.string   "post_code",                 null: false
    t.float    "latitude"
    t.float    "longitude"
    t.boolean  "display",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "quick_links", force: :cascade do |t|
    t.string   "link",                      null: false
    t.string   "link_text",                 null: false
    t.integer  "position",   default: 0,    null: false
    t.boolean  "display",    default: true, null: false
    t.string   "type"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "seo_entries", force: :cascade do |t|
    t.string   "nominal_url"
    t.string   "title"
    t.text     "meta_description"
    t.boolean  "in_sitemap",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "service_standards", force: :cascade do |t|
    t.string   "icon",                         null: false
    t.text     "content",                      null: false
    t.text     "hover_content",                null: false
    t.integer  "position",      default: 0,    null: false
    t.boolean  "display",       default: true, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.string   "link"
    t.string   "icon_text"
  end

  create_table "services", force: :cascade do |t|
    t.integer  "position",       default: 0
    t.string   "title",                                  null: false
    t.string   "colour"
    t.text     "summary"
    t.text     "content"
    t.string   "image"
    t.boolean  "display",        default: true
    t.string   "slug",                                   null: false
    t.string   "suggested_url"
    t.string   "style",          default: "basic",       null: false
    t.string   "layout",         default: "application", null: false
    t.integer  "sections_count", default: 0
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "services", ["slug"], name: "index_services_on_slug", using: :btree
  add_index "services", ["suggested_url"], name: "index_services_on_suggested_url", using: :btree

  create_table "services_categories", force: :cascade do |t|
    t.integer  "position",           default: 0,       null: false
    t.integer  "parent_id"
    t.string   "colour"
    t.string   "title",                                null: false
    t.text     "summary"
    t.text     "content"
    t.boolean  "display",            default: true
    t.string   "style",              default: "basic"
    t.string   "suggested_url"
    t.string   "slug",                                 null: false
    t.boolean  "homepage_highlight", default: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "services_categories", ["parent_id"], name: "index_services_categories_on_parent_id", using: :btree
  add_index "services_categories", ["slug"], name: "index_services_categories_on_slug", using: :btree
  add_index "services_categories", ["suggested_url"], name: "index_services_categories_on_suggested_url", using: :btree

  create_table "services_category_hierarchies", id: false, force: :cascade do |t|
    t.integer "ancestor_id",   null: false
    t.integer "descendant_id", null: false
    t.integer "generations",   null: false
  end

  add_index "services_category_hierarchies", ["ancestor_id", "descendant_id", "generations"], name: "category_anc_desc_idx", unique: true, using: :btree
  add_index "services_category_hierarchies", ["descendant_id"], name: "category_desc_idx", using: :btree

  create_table "services_category_section_items", force: :cascade do |t|
    t.integer  "services_category_section_id"
    t.string   "title"
    t.text     "context"
    t.string   "image"
    t.string   "style",                        default: "basic", null: false
    t.boolean  "display",                      default: true
    t.string   "subtitle"
    t.string   "button_text"
    t.string   "button_link"
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  add_index "services_category_section_items", ["services_category_section_id"], name: "index_srvcs_category_section_items_on_srvcs_category_section_id", using: :btree

  create_table "services_category_sections", force: :cascade do |t|
    t.integer  "services_category_id"
    t.integer  "position",             default: 0
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.boolean  "display",              default: true
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.string   "style",                default: "basic"
  end

  add_index "services_category_sections", ["services_category_id"], name: "index_services_category_sections_on_services_category_id", using: :btree

  create_table "services_section_items", force: :cascade do |t|
    t.integer  "services_section_id"
    t.integer  "position",            default: 0,       null: false
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.string   "style",               default: "basic", null: false
    t.boolean  "display",             default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "subtitle"
    t.string   "button_text"
    t.string   "button_link"
  end

  add_index "services_section_items", ["services_section_id"], name: "index_services_section_items_on_services_section_id", using: :btree

  create_table "services_sections", force: :cascade do |t|
    t.integer  "service_id"
    t.integer  "position",            default: 0,    null: false
    t.string   "title"
    t.text     "content"
    t.string   "image"
    t.string   "style"
    t.boolean  "display",             default: true
    t.integer  "section_items_count", default: 0,    null: false
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "subtitle"
    t.string   "button_link"
    t.string   "button_text"
  end

  add_index "services_sections", ["service_id"], name: "index_services_sections_on_service_id", using: :btree

  create_table "subcategories", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "image"
    t.text     "summary"
    t.boolean  "display",       default: true
    t.integer  "position",      default: 0,    null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "subcategories", ["slug"], name: "index_subcategories_on_slug", using: :btree
  add_index "subcategories", ["suggested_url"], name: "index_subcategories_on_suggested_url", using: :btree

  create_table "subcategories_guides", force: :cascade do |t|
    t.integer  "subcategory_id"
    t.integer  "guide_id"
    t.integer  "position",       default: 0, null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "subcategories_guides", ["guide_id"], name: "index_subcategories_guides_on_guide_id", using: :btree
  add_index "subcategories_guides", ["subcategory_id"], name: "index_subcategories_guides_on_subcategory_id", using: :btree

  create_table "subcategories_videos", force: :cascade do |t|
    t.integer  "subcategory_id"
    t.integer  "video_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "position",       default: 0, null: false
  end

  add_index "subcategories_videos", ["subcategory_id"], name: "index_subcategories_videos_on_subcategory_id", using: :btree
  add_index "subcategories_videos", ["video_id"], name: "index_subcategories_videos_on_video_id", using: :btree

  create_table "team_member_categories", force: :cascade do |t|
    t.string   "title",                     null: false
    t.integer  "position",      default: 0, null: false
    t.string   "category_type",             null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "team_member_categories", ["category_type"], name: "index_team_member_categories_on_category_type", unique: true, using: :btree

  create_table "team_member_categories_members", id: false, force: :cascade do |t|
    t.integer "team_member_id",          null: false
    t.integer "team_member_category_id", null: false
  end

  add_index "team_member_categories_members", ["team_member_category_id", "team_member_id"], name: "category_team_member", using: :btree
  add_index "team_member_categories_members", ["team_member_id", "team_member_category_id"], name: "team_member_category", using: :btree

  create_table "team_members", force: :cascade do |t|
    t.string   "forename",                  null: false
    t.string   "surname",                   null: false
    t.string   "image"
    t.text     "bio"
    t.string   "email"
    t.string   "phone"
    t.string   "role",                      null: false
    t.boolean  "display",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "slug"
    t.integer  "position",   default: 0,    null: false
  end

  create_table "testimonials", force: :cascade do |t|
    t.string   "title",                        null: false
    t.text     "content",                      null: false
    t.string   "author",                       null: false
    t.string   "role"
    t.integer  "case_study_id"
    t.boolean  "display",       default: true, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "testimonials", ["case_study_id"], name: "index_testimonials_on_case_study_id", using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "title",                             null: false
    t.string   "youtube_identifier",                null: false
    t.boolean  "display",            default: true, null: false
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "subtitle"
    t.text     "content"
  end

  create_table "what_we_do_links", force: :cascade do |t|
    t.integer  "what_we_do_id"
    t.string   "title",                        null: false
    t.boolean  "display",       default: true, null: false
    t.integer  "position",      default: 0,    null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.integer  "page_id"
  end

  add_index "what_we_do_links", ["page_id"], name: "index_what_we_do_links_on_page_id", unique: true, using: :btree
  add_index "what_we_do_links", ["what_we_do_id"], name: "index_what_we_do_links_on_what_we_do_id", using: :btree

  create_table "what_we_dos", force: :cascade do |t|
    t.string   "title",                       null: false
    t.text     "content"
    t.boolean  "display",      default: true, null: false
    t.integer  "position",     default: 0,    null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "links_count",  default: 0,    null: false
    t.string   "pdf_download"
    t.string   "image"
  end

  add_foreign_key "additional_home_contents", "videos"
  add_foreign_key "articles", "team_members", column: "author_id", on_delete: :cascade
  add_foreign_key "articles_guides", "articles"
  add_foreign_key "articles_guides", "guides"
  add_foreign_key "body_part_sections", "body_parts", on_delete: :cascade
  add_foreign_key "body_parts", "categories"
  add_foreign_key "case_studies", "clients", on_delete: :cascade
  add_foreign_key "categories_articles", "articles", on_delete: :cascade
  add_foreign_key "categories_articles", "categories", on_delete: :cascade
  add_foreign_key "categories_case_studies", "case_studies", on_delete: :cascade
  add_foreign_key "categories_case_studies", "categories", on_delete: :cascade
  add_foreign_key "categories_frequently_asked_questions", "categories", on_delete: :cascade
  add_foreign_key "categories_frequently_asked_questions", "frequently_asked_questions", on_delete: :cascade
  add_foreign_key "categories_guides", "categories", on_delete: :cascade
  add_foreign_key "categories_guides", "guides", on_delete: :cascade
  add_foreign_key "categories_testimonials", "categories", on_delete: :cascade
  add_foreign_key "categories_testimonials", "testimonials", on_delete: :cascade
  add_foreign_key "categories_videos", "categories", on_delete: :cascade
  add_foreign_key "categories_videos", "videos", on_delete: :cascade
  add_foreign_key "guide_downloads", "guides"
  add_foreign_key "guides", "videos", on_delete: :cascade
  add_foreign_key "job_applications", "job_listings"
  add_foreign_key "landing_pages_articles", "articles"
  add_foreign_key "landing_pages_articles", "landing_pages"
  add_foreign_key "landing_pages_case_studies", "case_studies"
  add_foreign_key "landing_pages_case_studies", "landing_pages"
  add_foreign_key "landing_pages_frequently_asked_questions", "frequently_asked_questions"
  add_foreign_key "landing_pages_frequently_asked_questions", "landing_pages"
  add_foreign_key "landing_pages_guides", "guides"
  add_foreign_key "landing_pages_guides", "landing_pages"
  add_foreign_key "landing_pages_sections", "landing_pages"
  add_foreign_key "landing_pages_service_standards", "landing_pages"
  add_foreign_key "landing_pages_service_standards", "service_standards"
  add_foreign_key "landing_pages_testimonials", "landing_pages"
  add_foreign_key "landing_pages_testimonials", "testimonials"
  add_foreign_key "landing_pages_videos", "landing_pages"
  add_foreign_key "landing_pages_videos", "videos"
  add_foreign_key "mailchimp_emails", "mailchimp_subscribers"
  add_foreign_key "pages_team_members", "pages"
  add_foreign_key "pages_team_members", "team_members"
  add_foreign_key "pages_testimonials", "pages", on_delete: :cascade
  add_foreign_key "pages_testimonials", "testimonials", on_delete: :cascade
  add_foreign_key "people_helped_sections", "categories", on_delete: :cascade
  add_foreign_key "policies_documents", "policies_categories"
  add_foreign_key "practice_applications_contacts", "practice_applications_practices", column: "practice_id", on_delete: :cascade
  add_foreign_key "practice_applications_practitioners", "practice_applications_practices", column: "practice_id", on_delete: :cascade
  add_foreign_key "services_category_section_items", "services_category_sections"
  add_foreign_key "services_category_sections", "services_categories"
  add_foreign_key "services_section_items", "services_sections"
  add_foreign_key "services_sections", "services"
  add_foreign_key "subcategories_guides", "guides"
  add_foreign_key "subcategories_guides", "subcategories"
  add_foreign_key "subcategories_videos", "subcategories"
  add_foreign_key "subcategories_videos", "videos"
  add_foreign_key "testimonials", "case_studies", on_delete: :cascade
  add_foreign_key "what_we_do_links", "pages", on_delete: :nullify
  add_foreign_key "what_we_do_links", "what_we_dos", on_delete: :cascade
end
