# frozen_string_literal: true

module CsvCreator
  class MailchimpSubscriberCreator < BaseCreator
    attr_reader :collection, :csv_columns

    def initialize(collection, csv_columns = nil)
      @collection = collection
      @csv_columns = csv_columns
    end

    private

    def column_names
      if csv_columns.blank? && collection.present?
        collection.first.class.column_names
      elsif csv_columns.present?
        csv_columns
      end
    end

    def data(csv)
      collection.each do |item|
        data = []
        column_names.each do |column|
          data << item.public_send(column)
        end
        csv << data
      end
      csv
    end
  end
end
