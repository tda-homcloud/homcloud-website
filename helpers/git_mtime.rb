module GitMtime
  module_function 

  @@git_available = nil
  
  def get(page)
    return Time.now unless page.source_file
    return File.mtime(page.source_file) unless Git.available?
    return File.mtime(page.source_file) unless Git.clean?(page.source_file)
    Git.each_commit(page.source_file) do |commit|
      return Time.at(commit[0].to_i) if Git.changed?(commit)
    end
    return File.mtime(page.source_file) 
  end

  module Git
    @@available = nil

    module_function
    
    def available?
      @@available = !! system("git", "rev-parse", err: File::NULL) if @@available.nil?
      @@available
    end

    def clean?(path)
      IO.popen(%w[git status --porcelain --] + [path]) do |out|
        out.read.empty?
      end
    end

    def each_commit(path)
      IO.popen(%w[git log --follow --numstat --format=%at --] + [path]) do |out|
        out.each_line.each_slice(3) { |lines| yield lines }
      end
    end

    def changed?(commit)
      insertions, deletions, = commit[2].split(/\t/).take(2).map(&:to_i)
      insertions != 0 || deletions != 0
    end
  end
end
