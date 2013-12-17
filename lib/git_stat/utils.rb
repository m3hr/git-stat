module GitStat
  def is_regex_empty?(regex_match)
    return scan(/#{regex_match}/).empty?
  end
  def get_first_git_revision(branch)
    # requires git 1.7.4.2+ http://stackoverflow.com/questions/1006775/how-to-reference-the-initial-commit
    first_with_newline = %x( git rev-list --max-parents=0 #{branch} )
    first_revision = first_with_newline.delete("\n")    
  end

  def get_latest_git_revision(branch)
    latest_with_newline = %x( git rev-parse #{branch} )
    latest_revision = latest_with_newline.delete("\n")
  end
end
