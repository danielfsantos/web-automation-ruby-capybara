require 'fileutils'

class UtilsCustomMethods

    def create_directory directory_path
        FileUtils.mkdir_p(directory_path)
    end

end