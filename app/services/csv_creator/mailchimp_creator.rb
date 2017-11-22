module CsvCreator
  class MailchimpCreator < BaseCreator
    STATS = ['opens', 'last_open', 'clicks', 'last_click', 'sends', 'last_sent']

    attr_reader :collection, :csv_columns, :email_titles

    def initialize(collection, csv_columns = nil)
      @collection = collection
      @csv_columns = csv_columns
      @email_titles = email_titles
    end

    private

    def column_names
      if csv_columns.blank? && collection.present?
        csv_columns = ['email_id']

        email_titles.each do |email|
          STATS.each do |stat|
            csv_columns << "#{email} #{stat}"
          end
        end
      elsif csv_columns.present?
        csv_columns
      end
      csv_columns
    end

    def email_titles
      @email_titles ||= ::Mailchimp::Email.select(:title).distinct.order(:title).pluck(:title)
    end

    def data(csv)
      collection.each do |item|
        data = []
        data << item.email_id
        email_titles.each do |column|
          STATS.each do |stat|
            data << item.emails.where(title: column).pluck(stat).first
          end
        end
        csv << data
      end
      csv
    end
  end
end
