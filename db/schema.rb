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

ActiveRecord::Schema.define(version: 20160701105528) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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
    t.string   "title",                                   null: false
    t.text     "summary",                                 null: false
    t.text     "content",                                 null: false
    t.string   "image"
    t.date     "date",                                    null: false
    t.boolean  "display",                  default: true, null: false
    t.boolean  "home_highlight",           default: true, null: false
    t.integer  "author_id"
    t.string   "slug"
    t.string   "url_originally_posted_on"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  add_index "articles", ["author_id"], name: "index_articles_on_author_id", using: :btree
  add_index "articles", ["slug"], name: "index_articles_on_slug", unique: true, using: :btree
  add_index "articles", ["title"], name: "index_articles_on_title", unique: true, using: :btree

  create_table "banners", force: :cascade do |t|
    t.string   "title",                     null: false
    t.string   "image",                     null: false
    t.integer  "position",   default: 0,    null: false
    t.boolean  "display",    default: true, null: false
    t.text     "summary"
    t.string   "link"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
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
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "categories_frequently_asked_questions", ["category_id"], name: "categories_faqs_category", using: :btree
  add_index "categories_frequently_asked_questions", ["frequently_asked_question_id"], name: "categories_faqs_faq", using: :btree

  create_table "categories_guides", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "guide_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories_guides", ["category_id"], name: "index_categories_guides_on_category_id", using: :btree
  add_index "categories_guides", ["guide_id"], name: "index_categories_guides_on_guide_id", using: :btree

  create_table "categories_testimonials", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "categories_testimonials", ["category_id"], name: "index_categories_testimonials_on_category_id", using: :btree
  add_index "categories_testimonials", ["testimonial_id"], name: "index_categories_testimonials_on_testimonial_id", using: :btree

  create_table "categories_videos", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "video_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "categories_videos", ["category_id"], name: "index_categories_videos_on_category_id", using: :btree
  add_index "categories_videos", ["video_id"], name: "index_categories_videos_on_video_id", using: :btree

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

  create_table "guides", force: :cascade do |t|
    t.string   "title",                     null: false
    t.text     "content"
    t.string   "image"
    t.string   "file",                      null: false
    t.boolean  "display",    default: true, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "video_id"
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
    t.string "key"
    t.string "value"
    t.string "environment"
  end

  create_table "pages", force: :cascade do |t|
    t.string   "title",                        null: false
    t.string   "slug"
    t.string   "suggested_url"
    t.string   "image"
    t.string   "style",                        null: false
    t.string   "layout",                       null: false
    t.boolean  "display",       default: true
    t.text     "content",                      null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "pages_testimonials", force: :cascade do |t|
    t.integer  "page_id"
    t.integer  "testimonial_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "pages_testimonials", ["page_id"], name: "index_pages_testimonials_on_page_id", using: :btree
  add_index "pages_testimonials", ["testimonial_id"], name: "index_pages_testimonials_on_testimonial_id", using: :btree

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

  create_table "service_standards", force: :cascade do |t|
    t.string   "icon",                         null: false
    t.text     "content",                      null: false
    t.text     "hover_content",                null: false
    t.integer  "position",      default: 0,    null: false
    t.boolean  "display",       default: true, null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

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
    t.string   "title",                      null: false
    t.text     "content"
    t.boolean  "display",     default: true, null: false
    t.integer  "position",    default: 0,    null: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.integer  "links_count", default: 0,    null: false
  end

  add_foreign_key "additional_home_contents", "videos"
  add_foreign_key "articles", "team_members", column: "author_id", on_delete: :cascade
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
  add_foreign_key "guides", "videos", on_delete: :cascade
  add_foreign_key "pages_testimonials", "pages", on_delete: :cascade
  add_foreign_key "pages_testimonials", "testimonials", on_delete: :cascade
  add_foreign_key "people_helped_sections", "categories", on_delete: :cascade
  add_foreign_key "testimonials", "case_studies", on_delete: :cascade
  add_foreign_key "what_we_do_links", "pages", on_delete: :nullify
  add_foreign_key "what_we_do_links", "what_we_dos", on_delete: :cascade
end
