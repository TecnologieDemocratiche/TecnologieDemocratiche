class District
  include Singleton

  def self.all
    @districts ||= YAML.load(File.read('config/data/districts.it.yml'))
  end
end
