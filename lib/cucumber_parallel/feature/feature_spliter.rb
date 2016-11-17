module CucumberParallel
  class FeatureSpliter

    def initialize(feature_path)
      @feature_path = feature_path
    end

    def split
      feature_files_path = Dir.glob("#{@feature_path}/**/*.feature")
      feature_dir_set = Set.new
      feature_files_path.each do |feature_file_path|
        feature_dir_set.add (File.dirname(feature_file_path))
      end
      feature_dir_set
    end
  end
end
