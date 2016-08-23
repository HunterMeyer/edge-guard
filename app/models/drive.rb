class Drive
  def self.all
    rows    = spreadsheet.worksheets[0].rows
    headers = rows[0]
    data    = rows[1..-1]
    data.map { |row| new(Hash[headers.zip(row)]) }
  end

  def initialize(attrs = {})
    attrs.each do |key, value|
      self.class.send(:attr_accessor, key)
      send("#{key}=", value)
    end
  end

  private

  def self.config_file
    "#{Rails.root}/config/google_drive_config.json"
  end

  def self.session
    GoogleDrive::Session.from_service_account_key(config_file)
  end

  def self.spreadsheet
    session.spreadsheet_by_key(spreadsheet_key)
  end
end
