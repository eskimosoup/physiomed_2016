module CsvCreator
  class BaseCreator
    require 'csv'

    def to_csv
      CSV.generate(headers: true) do |csv|
        csv << column_names
        csv << data(csv)
      end
    end
  end
end
